// Flutter Imports
import 'package:flutter/material.dart';

// Project Imports
import 'package:fis_app/src/features/about/presentation/about_screen_mobile.dart';
import 'package:fis_app/src/features/about/presentation/about_screen_web.dart';
import 'package:fis_app/src/utils/utils.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  static const String route = '/about';

  @override
  Widget build(BuildContext context) {
    return isMobile(context)
        ? const AboutScreenMobile()
        : const AboutScreenWeb();
  }
}
