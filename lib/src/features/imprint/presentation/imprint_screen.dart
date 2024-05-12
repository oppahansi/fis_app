// Flutter Imports
import 'package:flutter/material.dart';

// Project Imports
import 'package:fis_app/src/features/imprint/presentation/imprint_screen_mobile.dart';
import 'package:fis_app/src/features/imprint/presentation/imprint_screen_web.dart';
import 'package:fis_app/src/utils/utils.dart';

class ImprintScreen extends StatelessWidget {
  const ImprintScreen({super.key});

  static const String route = '/imprint';

  @override
  Widget build(BuildContext context) {
    return isMobile(context)
        ? const ImprintScreenMobile()
        : const ImprintScreenWeb();
  }
}
