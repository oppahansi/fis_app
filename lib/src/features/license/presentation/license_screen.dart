// Flutter Imports
import 'package:flutter/material.dart';

// Project Imports
import 'package:fis_app/src/features/license/presentation/license_screen_mobile.dart';
import 'package:fis_app/src/features/license/presentation/license_screen_web.dart';
import 'package:fis_app/src/utils/utils.dart';

class LicenseScreen extends StatelessWidget {
  const LicenseScreen({super.key});

  static const String route = '/license';

  @override
  Widget build(BuildContext context) {
    return isMobile(context)
        ? const LicenseScreenMobile()
        : const LicenseScreenWeb();
  }
}
