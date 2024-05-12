// Flutter Imports
import 'package:flutter/material.dart';

// Project Imports
import 'package:fis_app/src/features/shared/shared.dart';

class FisAppBarMobile extends StatelessWidget {
  const FisAppBarMobile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor:
          Theme.of(context).colorScheme.inversePrimary.withOpacity(0.25),
      title: Text(
        'FIS',
        style: Theme.of(context).textTheme.titleLarge,
      ),
      actions: const [
        ThemeToggle(),
      ],
    );
  }
}
