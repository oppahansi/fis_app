// Flutter Imports
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

// Package Imports
import 'package:url_launcher/url_launcher.dart';

// Project Imports
import 'package:fis_app/src/features/shared/shared.dart';
import 'package:fis_app/src/utils/utils.dart';

class ImprintScreenWeb extends StatelessWidget {
  const ImprintScreenWeb({super.key});

  static const String route = '/imprint';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const PreferredSize(
          preferredSize: Size.fromHeight(kToolbarHeight),
          child: FisAppBarWeb(),
        ),
        body: Center(
          child: SingleChildScrollView(
            child: SizedBox(
              width: screenWidth(context) * 0.8,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  verticalSpaceMedium,
                  _address(context),
                  verticalSpaceMedium,
                  _contact(context),
                  verticalSpaceMedium,
                  _imageSources(context),
                  verticalSpaceMassive,
                  const FooterWeb(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  RichText _address(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: "Imprint\n\n",
        style: Theme.of(context).textTheme.titleLarge,
        children: [
          TextSpan(
            text: "\Name Name",
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  fontWeight: FontWeight.bold,
                ),
            children: [
              TextSpan(
                text: "\n\n"
                    "Street and Number\n"
                    "Postal Code and City\n"
                    "Country",
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ],
          ),
        ],
      ),
    );
  }

  RichText _contact(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: "Contact\n\n",
        style: Theme.of(context).textTheme.titleMedium!.copyWith(
              fontWeight: FontWeight.bold,
            ),
        children: [
          TextSpan(
            text: "Email: ",
            style: Theme.of(context).textTheme.bodyLarge,
            children: [
              _linkTextSpan(context, "test@test.com", "mailto:test@test.com"),
            ],
          ),
        ],
      ),
    );
  }

  Widget _imageSources(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: "Image Sources",
        style: Theme.of(context).textTheme.titleMedium!.copyWith(
              fontWeight: FontWeight.bold,
            ),
        children: [
          TextSpan(
            text:
                "\n\nThe images displayed or visible on this website are sourced from various "
                "platforms and photographers known for providing high-quality, "
                "royalty-free content. We do not own or host any of the images "
                "directly on our site. For detailed information about the sources "
                "of each image, please refer to our dedicated Sources and/or License page. "
                "We acknowledge and appreciate the work of the talented "
                "photographers and platforms, such as Pexels, Unsplash, and Pixabay,"
                " among others, whose contributions enhance the visual experience of our website.",
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ],
      ),
    );
  }

  TextSpan _linkTextSpan(BuildContext context, String text, String url) {
    return TextSpan(
      text: text,
      style: TextStyle(
        color: Theme.of(context).colorScheme.primary,
        decoration: TextDecoration.underline,
      ),
      recognizer: TapGestureRecognizer()
        ..onTap = () {
          launchUrl(Uri.parse(url));
        },
    );
  }
}
