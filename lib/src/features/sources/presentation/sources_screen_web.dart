// Flutter Imports
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

// Package Imports
import 'package:url_launcher/url_launcher.dart';

// Project Imports
import 'package:fis_app/src/features/shared/shared.dart';
import 'package:fis_app/src/utils/utils.dart';

class SourcesScreenWeb extends StatelessWidget {
  const SourcesScreenWeb({super.key});

  static const String route = '/sources';

  static const pageSize = 30;

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
                  _introText(context),
                  verticalSpaceMedium,
                  _pexelsLogo(context),
                  verticalSpaceSmall,
                  _pexelsDescription(context),
                  verticalSpaceMedium,
                  _unsplashLogo(context),
                  verticalSpaceSmall,
                  _unsplashDescription(context),
                  verticalSpaceMedium,
                  _pixabayLogo(context),
                  verticalSpaceSmall,
                  _pixabayDescription(context),
                  verticalSpaceLarge,
                  _getInTouch(context),
                  const SelectableText(
                    "(test@test.com)",
                    style: TextStyle(
                      decoration: TextDecoration.none,
                    ),
                  ),
                  verticalSpaceMedium,
                  const FooterWeb(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _introText(BuildContext context) {
    return const Text(
        "Simplify your search for the perfect image with our carefully "
        "selected sources, ensuring you have access to a wealth of visually appealing"
        " content without the worry of licensing restrictions.\n\n"
        "Our current sources are:");
  }

  Widget _pexelsLogo(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () {
          launchUrl(Uri.parse("https://www.pexels.com/"));
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              _photoSourceToLogo("pexels"),
              height: 48,
            )
          ],
        ),
      ),
    );
  }

  Widget _pexelsDescription(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: "Pexels offers high-quality, free stock photos under its license,"
            " with a vast and constantly growing collection curated from user "
            "uploads and free image websites. Founded in 2014, Pexels empowers "
            "creators with unrestricted access to beautiful photos for diverse creative projects.",
        style: Theme.of(context).textTheme.bodyLarge,
        children: [
          _linkTextSpan(
            context,
            "Visit Pexels",
            "https://www.pexels.com/",
          ),
          const TextSpan(text: " to learn more."),
        ],
      ),
    );
  }

  Widget _unsplashLogo(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () {
          launchUrl(Uri.parse("https://www.unsplash.com/"));
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              _photoSourceToLogo("unsplash"),
              height: 48,
            )
          ],
        ),
      ),
    );
  }

  Widget _unsplashDescription(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: "Unsplash is the internet's source of over 3 million freely "
            "usable, hand-selected high-resolution images contributed by a community"
            " of nearly 300,000 photographers. Powering popular platforms like "
            "BuzzFeed and Squarespace, Unsplash fosters a global community where "
            "anyone, regardless of experience, can contribute and freely use images "
            "for creative endeavors.",
        style: Theme.of(context).textTheme.bodyLarge,
        children: [
          _linkTextSpan(
            context,
            "Visit Unsplash",
            "https://www.unsplash.com/?utm_source=free_image_search&utm_medium=referral",
          ),
          const TextSpan(text: " to learn more."),
        ],
      ),
    );
  }

  Widget _pixabayLogo(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () {
          launchUrl(Uri.parse("https://www.pixbay.com/"));
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              _photoSourceToLogo("pixabay"),
              height: 48,
            )
          ],
        ),
      ),
    );
  }

  Widget _pixabayDescription(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: "Pixabay is your go-to platform for high-quality, royalty-free "
            "images, offering a vast collection of photos, illustrations, and vector"
            " graphics. With a commitment to providing free and accessible content, "
            "Pixabay is a treasure trove for creatives, featuring user-contributed "
            "and sourced images. Discover stunning visuals for your projects and "
            "unlock a world of creative possibilities on Pixabay.",
        style: Theme.of(context).textTheme.bodyLarge,
        children: [
          _linkTextSpan(
            context,
            "Visit Pixabay",
            "https://www.pixabay.com/",
          ),
          const TextSpan(text: " to learn more."),
        ],
      ),
    );
  }

  Widget _getInTouch(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: "Want to be added as a source or have a question? ",
        style: Theme.of(context).textTheme.titleLarge,
        children: [
          _linkTextSpan(context, "Get in touch!", "mailto:test@test.com"),
        ],
      ),
    );
  }

  String _photoSourceToLogo(String source) {
    if (source == "pexels") {
      return "assets/images/pexels_logo_white.png";
    } else if (source == "unsplash") {
      return "assets/images/unsplash_logo_white.png";
    } else {
      return "assets/images/pixabay_logo_white.png";
    }
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
