// Flutter Imports
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Package Imports
import 'package:cached_network_image/cached_network_image.dart';

// Project Imports
import 'package:fis_app/src/features/shared/shared.dart';
import 'package:fis_app/src/utils/utils.dart';

class HomeSearchBarMobile extends ConsumerStatefulWidget {
  const HomeSearchBarMobile({super.key, required this.backdropImage});

  final FisImage backdropImage;

  @override
  ConsumerState<HomeSearchBarMobile> createState() => _SearchBarState();
}

class _SearchBarState extends ConsumerState<HomeSearchBarMobile> {
  final _controller = TextEditingController();
  late final FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _focusNode.requestFocus();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
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
                maxHeight: 200,
                maxWidth: screenWidth(context).toInt(),
              ),
              fit: BoxFit.cover,
              opacity: 0.25,
            ),
          ),
          width: screenWidth(context),
          height: 200,
        ),
        Positioned(
          top: 0,
          child: TopGradient(width: screenWidth(context), height: 150),
        ),
        Positioned(
          bottom: 0,
          child: BottomGradient(width: screenWidth(context), height: 150),
        ),
        Positioned(
          top: 75,
          bottom: 75,
          left: 25,
          width: screenWidth(context) * 0.9,
          child: _searchBar(),
        )
      ],
    );
  }

  Widget _searchBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SizedBox(
        width: screenWidth(context) * 0.9,
        height: 50,
        child: SearchBar(
          controller: _controller,
          focusNode: _focusNode,
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
        ),
      ),
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
