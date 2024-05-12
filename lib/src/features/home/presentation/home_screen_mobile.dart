// Flutter Imports
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

// Project Imports
import 'package:fis_app/src/app/app.dart';
import 'package:fis_app/src/features/shared/shared.dart';
import 'package:fis_app/src/utils/utils.dart';

class HomeScreenMobile extends ConsumerWidget {
  const HomeScreenMobile({super.key});

  static const String route = '/';

  static const pageSize = 10;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final scrollController = ScrollController();

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
                return Center(
                  child: Scrollbar(
                    controller: scrollController,
                    child: SingleChildScrollView(
                      controller: scrollController,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          HomeSearchBarMobile(
                              backdropImage: data.images!.randomElement),
                          verticalSpaceMedium,
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: RichText(
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
                          ),
                          verticalSpaceMedium,
                          MasonryGridView.count(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            crossAxisCount: 1,
                            mainAxisSpacing: 5,
                            crossAxisSpacing: 5,
                            itemCount: (data.images!.length / 3).ceil(),
                            itemBuilder: (context, index) {
                              return PhotoListTileMobile(
                                photo: data.images![index],
                                searchSource: _sourceToSearchSource(
                                  data.images![index],
                                  data.searchSources,
                                )!,
                                debugIndex: index,
                              );
                            },
                          ),
                          const FooterMobile(),
                        ],
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
