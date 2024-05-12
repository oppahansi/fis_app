// Flutter Imports
import 'package:flutter/material.dart';

// Project Imports
import 'package:fis_app/src/features/shared/shared.dart';
import 'package:fis_app/src/utils/utils.dart';

class FooterMobile extends StatelessWidget {
  const FooterMobile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: screenWidth(context),
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          verticalSpaceLarge,
          NavItemsMobile(),
          verticalSpaceLarge,
          Text('© 2024 Oppahansi'),
          verticalSpaceMedium
        ],
      ),
    );
  }
}
