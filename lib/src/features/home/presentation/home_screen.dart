// Flutter Imports
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Project Imports
import 'package:fis_app/src/features/home/presentation/home_screen_mobile.dart';
import 'package:fis_app/src/features/home/presentation/home_screen_web.dart';
import 'package:fis_app/src/utils/utils.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  static const String route = '/';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return isMobile(context) ? const HomeScreenMobile() : const HomeScreenWeb();
  }
}
