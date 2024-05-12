// Flutter Imports
import 'package:flutter/material.dart';

// Project Imports
import 'package:fis_app/src/features/shared/shared.dart';

class FisAppBarWeb extends StatelessWidget {
  const FisAppBarWeb({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor:
          Theme.of(context).colorScheme.inversePrimary.withOpacity(0.25),
      title: const NavItemsWeb(),
      actions: const [
        ThemeToggle(),
      ],
    );
  }
}
