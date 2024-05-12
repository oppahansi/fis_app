// Flutter Imports
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

// Project Imports
import 'package:fis_app/src/app/app.dart';
import 'package:fis_app/src/features/shared/shared.dart';
import 'package:fis_app/src/utils/utils.dart';

class HomeScreenWeb extends ConsumerStatefulWidget {
  const HomeScreenWeb({super.key});

  static const String route = '/';

  static const pageSize = 30;

  @override
  ConsumerState<HomeScreenWeb> createState() => _HomeScreenWebState();
}

class _HomeScreenWebState extends ConsumerState<HomeScreenWeb> {
  @override
  Widget build(BuildContext context) {
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

    return SafeArea(
      child: Scaffold(
        appBar: const PreferredSize(
          preferredSize: Size.fromHeight(kToolbarHeight),
          child: FisAppBarWeb(),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            scrollController.animateTo(
              0,
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeInOut,
            );
          },
          child: const Icon(Icons.arrow_upward),
        ),
        body: LayoutBuilder(
          builder: ((context, constraints) {
            final curatedResult = ref.watch(
              fetchCuratedProvider(
                pagination: ResultsPagination(
                  page: 1,
                  query: '',
                ),
              ),
            );

            return curatedResult.when(
              error: (err, stack) => Text('Error $err $stack'),
              loading: () => PhotoTileShimmer(
                width: screenWidth(context),
                height: screenHeight(context),
              ),
              data: (data) {
                focusNode.requestFocus();

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
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            HomeSearchBarWeb(
                              backdropImage: data.images!.randomElement,
                            ),
                            verticalSpaceMedium,
                            RichText(
                              text: TextSpan(
                                text:
                                    "Latest curated photos of leading image repositories:\n",
                                style: Theme.of(context).textTheme.titleLarge,
                                children: [
                                  const TextSpan().asLink(context, "Pexels",
                                      "https://www.pexels.com/"),
                                  const TextSpan(
                                    text: ", ",
                                  ),
                                  const TextSpan().asLink(context, "Unsplash",
                                      "https://www.unsplash.com/?utm_source=free_image_search&utm_medium=referral"),
                                  const TextSpan(
                                    text: ", ",
                                  ),
                                  const TextSpan().asLink(context, "Pixabay",
                                      "https://www.pixabay.com/"),
                                ],
                              ),
                            ),
                            verticalSpaceMedium,
                            MasonryGridView.count(
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              crossAxisCount: 3,
                              mainAxisSpacing: 5,
                              crossAxisSpacing: 5,
                              itemCount: data.images!.length,
                              itemBuilder: (context, index) {
                                return PhotoListTileWeb(
                                  photo: data.images![index],
                                  searchSource: _sourceToSearchSource(
                                    data.images![index],
                                    data.searchSources,
                                  )!,
                                  debugIndex: index,
                                );
                              },
                            ),
                            const FooterWeb(),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            );
          }),
        ),
      ),
    );
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
}
