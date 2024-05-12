// Flutter Imports
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

// Package Imports
import 'package:url_launcher/url_launcher.dart';

// Project Imports
import 'package:fis_app/src/features/shared/shared.dart';
import 'package:fis_app/src/utils/utils.dart';

class AboutScreenWeb extends StatelessWidget {
  const AboutScreenWeb({super.key});

  static const String route = '/about';

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
              width: screenWidth(context) * 0.75,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  verticalSpaceMedium,
                  _aboutContent(context),
                  const FooterWeb(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  RichText _aboutContent(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: "About\n\n",
        style: Theme.of(context).textTheme.titleLarge,
        children: [
          TextSpan(
            text: "Welcome to Free Image Search, your ultimate destination for "
                "simplified access to a diverse array of license-free photos!"
                "\n\nWe've harnessed the power of leading image repositories, ",
            style: Theme.of(context).textTheme.bodyLarge,
            children: [
              _linkTextSpan(context, "Pexels", "https://www.pexels.com/"),
              const TextSpan(
                text: ", ",
              ),
              _linkTextSpan(context, "Unsplash",
                  "https://www.unsplash.com/?utm_source=free_image_search&utm_medium=referral"),
              const TextSpan(
                text: ", ",
              ),
              _linkTextSpan(context, "Pixabay", "https://www.pixabay.com/"),
              const TextSpan(
                text: ", to bring you a streamlined search experience "
                    "without the need to navigate multiple sites.",
              ),
              TextSpan(
                text: "\n\nKey Features\n\n",
                style: Theme.of(context).textTheme.titleLarge,
              ),
              TextSpan(
                text: "Centralized Search",
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              TextSpan(
                text:
                    "\nSave time and effort by searching for license-free photos "
                    "across ",
                style: Theme.of(context).textTheme.bodyLarge,
                children: [
                  _linkTextSpan(context, "Pexels", "https://www.pexels.com/"),
                  const TextSpan(
                    text: ", ",
                  ),
                  _linkTextSpan(context, "Unsplash",
                      "https://www.unsplash.com/?utm_source=free_image_search&utm_medium=referral"),
                  const TextSpan(
                    text: ", ",
                  ),
                  _linkTextSpan(context, "Pixabay", "https://www.pixabay.com/"),
                  const TextSpan(
                      text: " simultaneously. Our "
                          "platform combines the results, shuffling them at the end to"
                          " ensure an unbiased selection. Explore a vast collection of "
                          "images in one convenient place."),
                ],
              ),
              TextSpan(
                text: "\n\nShuffeled Results",
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              TextSpan(
                text:
                    "\nWe believe in fairness. To avoid any bias, the search results"
                    " are shuffled, providing an unbiased and varied selection of "
                    "images for your creative projects.",
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              TextSpan(
                text: "\n\nDirect Linking",
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              TextSpan(
                text:
                    "\nDiscover the perfect images effortlessly. While we don't "
                    "provide direct download links, we seamlessly redirect you to"
                    " the respective websites (",
                style: Theme.of(context).textTheme.bodyLarge,
                children: [
                  _linkTextSpan(context, "Pexels", "https://www.pexels.com/"),
                  const TextSpan(
                    text: ", ",
                  ),
                  _linkTextSpan(context, "Unsplash",
                      "https://www.unsplash.com/?utm_source=free_image_search&utm_medium=referral"),
                  const TextSpan(
                    text: ", ",
                  ),
                  _linkTextSpan(context, "Pixabay", "https://www.pixabay.com/"),
                  TextSpan(
                    text:
                        ") where you can easily access and download the images you desire.",
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ],
              ),
              TextSpan(
                text: "\n\nLicense Information",
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              TextSpan(
                text: "\nEnsuring transparency, we redirect you to the "
                    "respective API licenses of ",
                style: Theme.of(context).textTheme.bodyLarge,
                children: [
                  _linkTextSpan(context, "Pexels License",
                      "https://www.pexels.com/license/"),
                  const TextSpan(
                    text: ", ",
                  ),
                  _linkTextSpan(context, "Unsplash License",
                      "https://www.unsplash.com/license/?utm_source=free_image_search&utm_medium=referral"),
                  const TextSpan(
                    text: ", and ",
                  ),
                  _linkTextSpan(context, "Pixabay License",
                      "https://www.pixabay.com/service/license-summary/"),
                  TextSpan(
                    text: ". You can review the licensing details "
                        "directly from the source, giving you confidence "
                        "in using the images for your personal and commercial projects.",
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ],
              ),
              TextSpan(
                text:
                    "\n\n\nFree Image Search is designed to enhance your creative"
                    " process, offering a simple and efficient way to discover "
                    "license-free photos."
                    "\n\nExplore. Search. Get Inspired.\n\n"
                    "Free Image Search - Where Creative Minds Unite!",
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ],
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
