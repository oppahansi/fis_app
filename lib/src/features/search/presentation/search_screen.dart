// Flutter Imports
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Project Imports
import 'package:fis_app/src/features/search/presentation/search_screen_mobile.dart';
import 'package:fis_app/src/features/search/presentation/search_screen_web.dart';
import 'package:fis_app/src/utils/utils.dart';

class SearchScreen extends ConsumerWidget {
  const SearchScreen({super.key});

  static const String route = '/search';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return isMobile(context)
        ? const SearchScreenMobile()
        : const SearchScreenWeb();
  }
}
