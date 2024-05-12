// Flutter Imports
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

// Project Imports
import 'package:fis_app/src/features/shared/shared.dart';
import 'package:fis_app/src/utils/utils.dart';

class SearchScreenWeb extends ConsumerStatefulWidget {
  const SearchScreenWeb({super.key});

  static const String route = '/search';

  @override
  ConsumerState<SearchScreenWeb> createState() => _SearchScreenWebState();
}

class _SearchScreenWebState extends ConsumerState<SearchScreenWeb> {
  final scrollController = ScrollController();
  final FocusNode focusNode = FocusNode();

  @override
  void dispose() {
    scrollController.dispose();
    focusNode.dispose();
    super.dispose();
  }

  void handleKeyEvent(RawKeyEvent event) {
    var offset = scrollController.offset;

    if (event.logicalKey == LogicalKeyboardKey.arrowUp && offset > 0) {
      setState(() {
        if (kReleaseMode) {
          scrollController.animateTo(
            offset - 200,
            duration: const Duration(milliseconds: 50),
            curve: Curves.ease,
          );
        } else {
          scrollController.animateTo(
            offset - 200,
            duration: const Duration(milliseconds: 50),
            curve: Curves.ease,
          );
        }
      });
    } else if (event.logicalKey == LogicalKeyboardKey.arrowDown &&
        offset < scrollController.position.maxScrollExtent) {
      setState(() {
        if (kReleaseMode) {
          scrollController.animateTo(
            offset + 200,
            duration: const Duration(milliseconds: 50),
            curve: Curves.ease,
          );
        } else {
          scrollController.animateTo(
            offset + 200,
            duration: const Duration(milliseconds: 50),
            curve: Curves.ease,
          );
        }
      });
    } else if (!focusNode.hasFocus &&
        event.logicalKey == LogicalKeyboardKey.space &&
        offset < scrollController.position.maxScrollExtent) {
      setState(() {
        if (kReleaseMode) {
          scrollController.animateTo(
            offset + 400,
            duration: const Duration(milliseconds: 50),
            curve: Curves.ease,
          );
        } else {
          scrollController.animateTo(
            offset + 400,
            duration: const Duration(milliseconds: 50),
            curve: Curves.ease,
          );
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final query = ref.watch(searchTextProvider);

    return SafeArea(
      child: Scaffold(
        appBar: const PreferredSize(
          preferredSize: Size.fromHeight(kToolbarHeight),
          child: FisAppBarWeb(),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            if (scrollController.hasClients) {
              scrollController.animateTo(
                0,
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeInOut,
              );
            }
          },
          child: const Icon(Icons.arrow_upward),
        ),
        body: LayoutBuilder(
          builder: ((context, constraints) {
            return Center(
              child: Scrollbar(
                controller: scrollController,
                child: RawKeyboardListener(
                  autofocus: true,
                  focusNode: focusNode,
                  onKey: handleKeyEvent,
                  child: SingleChildScrollView(
                    controller: scrollController,
                    child: Column(
                      children: [
                        verticalSpaceMedium,
                        const FisSearchBar(),
                        verticalSpaceMedium,
                        query.isNotEmpty
                            ? _buildResults(
                                ref,
                                context,
                                scrollController,
                              )
                            : const SizedBox.shrink(),
                        verticalSpaceMedium,
                        const FooterWeb(),
                      ],
                    ),
                  ),
                ),
              ),
            );
          }),
        ),
      ),
    );
  }

  Widget _buildResults(
    WidgetRef ref,
    BuildContext context,
    ScrollController controller,
  ) {
    return ref.watch(searchPhotosProvider).when(
        error: (err, stack) => Text('Error $err $stack'),
        loading: () => PhotoTileShimmer(
              width: screenWidth(context),
              height: screenHeight(context),
            ),
        data: (data) {
          focusNode.requestFocus();

          return Column(
            children: [
              MasonryGridView.builder(
                gridDelegate:
                    const SliverSimpleGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                ),
                itemCount: data.images!.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  final photo = data.images![index];
                  return PhotoListTileWeb(
                    photo: photo,
                    searchSource: _sourceToSearchSource(
                      photo,
                      data.searchSources,
                    )!,
                  );
                },
                mainAxisSpacing: 4.0,
                crossAxisSpacing: 4.0,
              ),
              if (data.images!.isEmpty)
                const Text(
                  "No results found",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              verticalSpaceMedium,
              if (data.images!.isNotEmpty)
                _loadPaginationButtons(ref, controller, data),
              verticalSpaceSmall,
              if (data.images!.isNotEmpty) _pageButtons(ref, controller, data),
            ],
          );
        });
  }

  String? _sourceToSearchSource(FisImage photo, SearchSource? searchSources) {
    if (photo.source!.contains('pexels')) {
      return searchSources!.pexels;
    } else if (photo.source!.contains('unsplash')) {
      return searchSources!.unsplash;
    } else {
      return searchSources!.pixabay;
    }
  }

  Widget _loadPaginationButtons(
      WidgetRef ref, ScrollController controller, FisResult result) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        if (result.page! > 1)
          ElevatedButton(
            onPressed: () {
              ref.read(pageProvider.notifier).update((state) => state - 1);
              controller.animateTo(
                0,
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
              );
            },
            child: const Row(
              children: [
                Icon(Icons.arrow_back),
                Text(" Previous"),
              ],
            ),
          ),
        if (result.page! < result.total! / 30)
          ElevatedButton(
            onPressed: () {
              ref.read(pageProvider.notifier).update((state) => state + 1);
              controller.animateTo(
                0,
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
              );
            },
            child: const Row(
              children: [
                Text("Next "),
                Icon(Icons.arrow_forward),
              ],
            ),
          )
      ],
    );
  }

  Widget _pageButtons(
      WidgetRef ref, ScrollController controller, FisResult result) {
    var totalPages = (result.total! / 30).ceil();
    var currentPage = result.page!;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        if (currentPage > 3)
          ElevatedButton(
            onPressed: () {
              ref.read(pageProvider.notifier).update((state) => 1);
              controller.animateTo(
                0,
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
              );
            },
            child: const Text("1"),
          ),
        if (currentPage - 2 > 0)
          ElevatedButton(
            onPressed: () {
              ref
                  .read(pageProvider.notifier)
                  .update((state) => currentPage - 2);
              controller.animateTo(
                0,
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
              );
            },
            child: Text((currentPage - 2).toString()),
          ),
        if (currentPage - 1 > 0)
          ElevatedButton(
            onPressed: () {
              ref
                  .read(pageProvider.notifier)
                  .update((state) => currentPage - 1);
              controller.animateTo(
                0,
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
              );
            },
            child: Text((currentPage - 1).toString()),
          ),
        ElevatedButton(
          onPressed: null,
          child: Text(currentPage.toString()),
        ),
        if (currentPage + 1 < totalPages)
          ElevatedButton(
            onPressed: () {
              ref
                  .read(pageProvider.notifier)
                  .update((state) => currentPage + 1);
              controller.animateTo(
                0,
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
              );
            },
            child: Text((currentPage + 1).toString()),
          ),
        if (currentPage + 2 < totalPages)
          ElevatedButton(
            onPressed: () {
              ref
                  .read(pageProvider.notifier)
                  .update((state) => currentPage + 2);
              controller.animateTo(
                0,
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
              );
            },
            child: Text((currentPage + 2).toString()),
          ),
      ],
    );
  }
}
