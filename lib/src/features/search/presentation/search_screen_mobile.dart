// Flutter Imports
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Project Imports
import 'package:fis_app/src/features/shared/shared.dart';
import 'package:fis_app/src/utils/utils.dart';

class SearchScreenMobile extends ConsumerWidget {
  const SearchScreenMobile({super.key});

  static const String route = '/search';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final scrollController = ScrollController();
    final query = ref.watch(searchTextProvider);

    return SafeArea(
      child: Scaffold(
        appBar: const PreferredSize(
          preferredSize: Size.fromHeight(kToolbarHeight),
          child: FisAppBarMobile(),
        ),
        drawer: const Drawer(
          child: NavItemsMobile(),
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
                child: SingleChildScrollView(
                  controller: scrollController,
                  child: Column(
                    children: [
                      verticalSpaceMedium,
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.0),
                        child: FisSearchBar(),
                      ),
                      verticalSpaceMedium,
                      query.isNotEmpty
                          ? _buildResults(
                              ref,
                              context,
                              scrollController,
                            )
                          : const SizedBox.shrink(),
                      const FooterMobile(),
                    ],
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
        error: (err, stack) => const Text('Something went wrong..'),
        loading: () => PhotoTileShimmer(
              width: screenWidth(context),
              height: screenHeight(context),
            ),
        data: (data) {
          return Column(
            children: [
              ListView.builder(
                itemCount: data.images!.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  final photo = data.images![index];
                  return PhotoListTileMobile(
                    photo: photo,
                    searchSource: _sourceToSearchSource(
                      photo,
                      data.searchSources,
                    )!,
                  );
                },
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
