// Flutter Imports
import 'package:flutter/material.dart';

// Project Imports
import 'package:fis_app/src/features/features.dart';

class NavItemsWeb extends StatelessWidget {
  const NavItemsWeb({super.key});

  @override
  Widget build(BuildContext context) {
    var routeName = ModalRoute.of(context)?.settings.name;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          MouseRegion(
            cursor: routeName != HomeScreen.route
                ? SystemMouseCursors.click
                : SystemMouseCursors.basic,
            child: GestureDetector(
              onTap: routeName != HomeScreen.route
                  ? () => Navigator.pushNamed(context, HomeScreen.route)
                  : null,
              child: Text(
                'Free Images Search',
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
          ),
          const Spacer(),
          TextButton(
            onPressed: routeName != HomeScreen.route
                ? () => Navigator.pushNamed(context, HomeScreen.route)
                : null,
            child: const Text('Home'),
          ),
          TextButton(
            onPressed: routeName != SearchScreen.route
                ? () => Navigator.pushNamed(context, SearchScreen.route)
                : null,
            child: const Text('Search'),
          ),
          TextButton(
            onPressed: routeName != AboutScreen.route
                ? () => Navigator.pushNamed(context, AboutScreen.route)
                : null,
            child: const Text('About'),
          ),
          TextButton(
            onPressed: routeName != SourcesScreen.route
                ? () => Navigator.pushNamed(context, SourcesScreen.route)
                : null,
            child: const Text('Sources'),
          ),
          TextButton(
            onPressed: routeName != LicenseScreen.route
                ? () => Navigator.pushNamed(context, LicenseScreen.route)
                : null,
            child: const Text('License'),
          ),
          TextButton(
            onPressed: routeName != ImprintScreen.route
                ? () => Navigator.pushNamed(context, ImprintScreen.route)
                : null,
            child: const Text('Imprint'),
          ),
        ],
      ),
    );
  }
}
