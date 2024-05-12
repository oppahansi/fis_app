// Flutter Imports
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Package Imports
import 'package:cached_network_image/cached_network_image.dart';

// Project Imports
import 'package:fis_app/src/features/shared/shared.dart';
import 'package:fis_app/src/utils/utils.dart';

class HomeSearchBarWeb extends ConsumerStatefulWidget {
  const HomeSearchBarWeb({super.key, required this.backdropImage});

  final FisImage backdropImage;

  @override
  ConsumerState<HomeSearchBarWeb> createState() => _SearchBarState();
}

class _SearchBarState extends ConsumerState<HomeSearchBarWeb> {
  final _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: CachedNetworkImageProvider(
                widget.backdropImage.preview!,
                maxHeight: 400,
                maxWidth: screenWidth(context).toInt(),
              ),
              fit: BoxFit.cover,
              opacity: 0.25,
            ),
          ),
          width: screenWidth(context),
          height: 400,
          child: Center(
            child: _searchBar(),
          ),
        ),
        Positioned(
          top: 0,
          child: TopGradient(width: screenWidth(context), height: 150),
        ),
        Positioned(
          bottom: 0,
          child: BottomGradient(width: screenWidth(context), height: 150),
        ),
      ],
    );
  }

  SearchBar _searchBar() {
    return SearchBar(
      controller: _controller,
      onSubmitted: (value) {
        if (_controller.text.isNotEmpty) {
          _submitNew(value);
        }
      },
      padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
          const EdgeInsets.symmetric(horizontal: 16)),
      leading: const Icon(Icons.search),
      hintText: 'Search license free Photos',
      trailing: [
        IconButton(
          icon: const Icon(Icons.clear),
          onPressed: () => _resetSearch(),
        ),
      ],
    );
  }

  void _resetSearch() {
    _controller.clear();

    ref.read(pageProvider.notifier).update((state) => 1);
    ref.read(searchTextProvider.notifier).update((state) => "");
  }

  void _submitNew(value) {
    if (value.isEmpty) {
      return;
    }

    ref.read(pageProvider.notifier).update((state) => 1);
    ref.read(searchTextProvider.notifier).update((state) => value);

    Navigator.pushNamed(context, '/search');
  }
}
