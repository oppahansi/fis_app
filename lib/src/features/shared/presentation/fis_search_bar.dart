// Flutter Imports
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Project Imports
import 'package:fis_app/src/features/shared/shared.dart';

class FisSearchBar extends ConsumerStatefulWidget {
  const FisSearchBar({super.key});

  @override
  ConsumerState<FisSearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends ConsumerState<FisSearchBar> {
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
    final query = ref.watch(searchTextProvider);

    if (_controller.text != query) {
      _controller.text = query;
    }

    return SearchBar(
      controller: _controller,
      focusNode: _focusNode,
      onSubmitted: (value) {
        _submitNew(value);
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
    if (_controller.text.isEmpty) {
      return;
    }

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
  }
}
