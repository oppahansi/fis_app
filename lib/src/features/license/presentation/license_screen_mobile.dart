// Flutter Imports
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

// Package Imports
import 'package:url_launcher/url_launcher.dart';

// Project Imports
import 'package:fis_app/src/features/shared/shared.dart';
import 'package:fis_app/src/utils/utils.dart';

class LicenseScreenMobile extends StatelessWidget {
  const LicenseScreenMobile({super.key});

  static const String route = '/license';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const PreferredSize(
          preferredSize: Size.fromHeight(kToolbarHeight),
          child: FisAppBarMobile(),
        ),
        drawer: const Drawer(
          child: NavItemsMobile(),
        ),
        body: Center(
          child: SingleChildScrollView(
            child: SizedBox(
              width: screenWidth(context) * 0.9,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  verticalSpaceMedium,
                  _licenseContent(context),
                  verticalSpaceMedium,
                  const FooterMobile(),
                  verticalSpaceMedium,
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  RichText _licenseContent(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: "License Information\n\n",
        style: Theme.of(context).textTheme.titleLarge,
        children: [
          TextSpan(
            text: "\nFree Image Search is a platform dedicated to simplifying "
                "your search for license-free photos across multiple renowned sources, including ",
            style: Theme.of(context).textTheme.bodyLarge,
            children: [
              _linkTextSpan(context, "Pexels", "https://www.pexels.com/"),
              const TextSpan(
                text: ", ",
              ),
              _linkTextSpan(context, "Unsplash",
                  "https://www.unsplash.com/?utm_source=free_image_search&utm_medium=referral"),
              const TextSpan(
                text: ", and ",
              ),
              _linkTextSpan(context, "Pixabay", "https://www.pixabay.com/"),
              TextSpan(
                text: ". It's important to note that Free Image Search does not"
                    " provide licenses for the images displayed on our platform.",
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ],
          ),
          TextSpan(
            text: "\n\nLicense Details",
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          TextSpan(
            text: "\nThe licensing details for each image are governed by "
                "the respective API providers—",
            style: Theme.of(context).textTheme.bodyLarge,
            children: [
              _linkTextSpan(
                  context, "Pexels License", "https://www.pexels.com/license/"),
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
                text:
                    ". When you find an image of interest on Free Image Search"
                    ", we redirect you to the source website where you can access "
                    "the specific license information provided by the respective API.",
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ],
          ),
          TextSpan(
            text: "\n\nUnderstanding Licensing",
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          TextSpan(
            text: "\nWe highly recommend that users review and adhere to the "
                "licensing terms set forth by ",
            style: Theme.of(context).textTheme.bodyLarge,
            children: [
              _linkTextSpan(context, "Pexels", "https://www.pexels.com/"),
              const TextSpan(
                text: ", ",
              ),
              _linkTextSpan(context, "Unsplash",
                  "https://www.unsplash.com/?utm_source=free_image_search&utm_medium=referral"),
              const TextSpan(
                text: ", and ",
              ),
              _linkTextSpan(context, "Pixabay", "https://www.pixabay.com/"),
              TextSpan(
                text:
                    ". Each platform may have unique licensing conditions that "
                    "dictate how the images can be used, whether for personal or commercial projects.",
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ],
          ),
          TextSpan(
            text: "\n\nYour Responsibility",
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          TextSpan(
            text: "\nBy utilizing Free Image Search and subsequently being "
                "redirected to the original platforms, users are responsible for "
                "understanding and complying with the terms and conditions outlined by ",
            style: Theme.of(context).textTheme.bodyLarge,
            children: [
              _linkTextSpan(context, "Pexels", "https://www.pexels.com/"),
              const TextSpan(
                text: ", ",
              ),
              _linkTextSpan(context, "Unsplash",
                  "https://www.unsplash.com/?utm_source=free_image_search&utm_medium=referral"),
              const TextSpan(
                text: ", and ",
              ),
              _linkTextSpan(context, "Pixabay", "https://www.pixabay.com/"),
              TextSpan(
                text: ". It is imperative to familiarize yourself with the "
                    "licensing details to ensure proper usage of the images.",
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ],
          ),
          TextSpan(
            text: "\n\nQuestions and Support",
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          TextSpan(
            text:
                "\nIf you have any questions or need support regarding licensing"
                ", we encourage you to reach out directly to the respective API providers—",
            style: Theme.of(context).textTheme.bodyLarge,
            children: [
              _linkTextSpan(context, "Pexels", "https://www.pexels.com/"),
              const TextSpan(
                text: ", ",
              ),
              _linkTextSpan(context, "Unsplash",
                  "https://www.unsplash.com/?utm_source=free_image_search&utm_medium=referral"),
              const TextSpan(
                text: ", and ",
              ),
              _linkTextSpan(context, "Pixabay", "https://www.pixabay.com/"),
              TextSpan(
                text:
                    ". They are best equipped to provide accurate and detailed"
                    " information about the permissions and restrictions associated with each image."
                    "\n\nThank you for using Free Image Search as your centralized image discovery platform.",
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
