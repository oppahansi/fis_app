// Flutter Imports
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_web_plugins/url_strategy.dart';

// Project Imports
import 'package:fis_app/src/app/app.dart';
import 'package:fis_app/src/features/features.dart';
import 'package:fis_app/src/features/shared/shared.dart';

Future<void> main() async {
  usePathUrlStrategy();

  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeModeProvider);

    return MaterialApp(
      initialRoute: HomeScreen.route,
      title: 'Free Images Search',
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: themeMode,
      routes: {
        HomeScreen.route: (context) => const HomeScreen(),
        SearchScreen.route: (context) => const SearchScreen(),
        AboutScreen.route: (context) => const AboutScreen(),
        SourcesScreen.route: (context) => const SourcesScreen(),
        LicenseScreen.route: (context) => const LicenseScreen(),
        ImprintScreen.route: (context) => const ImprintScreen(),
      },
    );
  }
}
