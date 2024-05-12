// Flutter Imports
import 'package:flutter/material.dart';

// Project Imports
import 'package:fis_app/src/features/sources/presentation/sources_screen_mobile.dart';
import 'package:fis_app/src/features/sources/presentation/sources_screen_web.dart';
import 'package:fis_app/src/utils/utils.dart';

class SourcesScreen extends StatelessWidget {
  const SourcesScreen({super.key});

  static const String route = '/sources';

  @override
  Widget build(BuildContext context) {
    return isMobile(context)
        ? const SourcesScreenMobile()
        : const SourcesScreenWeb();
  }
}
