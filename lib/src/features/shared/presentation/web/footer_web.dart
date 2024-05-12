// Flutter Imports
import 'package:flutter/material.dart';

// Project Imports
import 'package:fis_app/src/features/shared/shared.dart';
import 'package:fis_app/src/utils/utils.dart';

class FooterWeb extends StatelessWidget {
  const FooterWeb({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: screenWidth(context) * 0.8,
      height: 200,
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          NavItemsWeb(),
          verticalSpaceLarge,
          Text('© 2024 Oppahansi'),
        ],
      ),
    );
  }
}
