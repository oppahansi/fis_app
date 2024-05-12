// Flutter Imports
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

// Package Imports
import 'package:cached_network_image/cached_network_image.dart';
import 'package:url_launcher/url_launcher.dart';

// Project Imports
import 'package:fis_app/src/features/shared/shared.dart';
import 'package:fis_app/src/utils/utils.dart';

class PhotoListTileWeb extends StatefulWidget {
  const PhotoListTileWeb({
    super.key,
    required this.photo,
    required this.searchSource,
    // debugging hint to show the tile index
    this.debugIndex,
  });
  final FisImage photo;
  final String searchSource;
  final int? debugIndex;

  @override
  State<PhotoListTileWeb> createState() => _PhotoListTileWebState();
}

class _PhotoListTileWebState extends State<PhotoListTileWeb> {
  bool _hovering = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        launchUrl(Uri.parse(_appendReferral(widget.photo.url!)));
      },
      child: MouseRegion(
        onEnter: (event) => _mouseEnter(true),
        onExit: (event) => _mouseEnter(false),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          child: Container(
            constraints: BoxConstraints(maxWidth: thirdScreenWidth(context)),
            child: AnimatedSwitcher(
              switchOutCurve: Curves.easeOutCubic,
              duration: const Duration(milliseconds: 300),
              child: _hovering ? _imageHover(context) : _image(context),
            ),
          ),
        ),
      ),
    );
  }

  Widget _image(BuildContext context) {
    return Stack(
      key: ValueKey<String>(widget.photo.url!),
      children: [
        CachedNetworkImage(
          imageUrl: widget.photo.preview!,
          fit: BoxFit.cover,
          width: thirdScreenWidth(context),
          placeholder: (context, url) => PhotoTileShimmer(
            width: thirdScreenWidth(context),
            height: thirdScreenWidth(context),
          ),
        ),
      ],
    );
  }

  Widget _imageHover(BuildContext context) {
    return Stack(
      key: ValueKey<String>(widget.photo.url!),
      children: [
        CachedNetworkImage(
          imageUrl: widget.photo.preview!,
          fit: BoxFit.cover,
          width: thirdScreenWidth(context),
          placeholder: (context, url) => PhotoTileShimmer(
            width: thirdScreenWidth(context),
            height: thirdScreenWidth(context),
          ),
        ),
        Positioned(
          top: 0,
          child: TopGradient(width: thirdScreenWidth(context), height: 150),
        ),
        Positioned(
          bottom: 0,
          child: BottomGradient(width: thirdScreenWidth(context), height: 150),
        ),
        const Positioned(
          top: 16,
          right: 16,
          child: Icon(Icons.open_in_new, color: Colors.white),
        ),
        Positioned(
          left: 16,
          top: 16,
          child: RichText(
            text: TextSpan(
              text: "Photo by ",
              style: const TextStyle(
                color: Colors.white,
              ),
              children: <TextSpan>[
                TextSpan(
                  text: widget.photo.photographer!.split("/").last,
                  style: const TextStyle(
                    color: Color.fromARGB(255, 129, 175, 255),
                    decoration: TextDecoration.underline,
                  ),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      launchUrl(Uri.parse(
                          _appendReferral(widget.photo.photographer!)));
                    },
                ), //inner span 1
                const TextSpan(text: " on "),
                TextSpan(
                  text: widget.photo.source!.split(".")[1],
                  style: const TextStyle(
                    color: Color.fromARGB(255, 129, 175, 255),
                    decoration: TextDecoration.underline,
                  ),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      launchUrl(
                          Uri.parse(_appendReferral(widget.photo.source!)));
                    },
                ), //inner span 3
              ],
            ),
          ),
        ),
        Positioned(
            bottom: 16,
            right: 16,
            child: MouseRegion(
              cursor: SystemMouseCursors.click,
              child: GestureDetector(
                onTap: () {
                  launchUrl(Uri.parse(_appendReferral(widget.searchSource)));
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Continue on "),
                    const SizedBox(width: 8),
                    Image.asset(
                      _photoSourceToLogo(),
                      height: 36,
                    )
                  ],
                ),
              ),
            )),
      ],
    );
  }

  void _mouseEnter(bool hover) {
    setState(() {
      _hovering = hover;
    });
  }

  String _photoSourceToLogo() {
    if (widget.photo.source!.contains("unsplash")) {
      return "assets/images/unsplash_logo_white.png";
    } else if (widget.photo.source!.contains("pexels")) {
      return "assets/images/pexels_logo_white.png";
    } else {
      return "assets/images/pixabay_logo_white.png";
    }
  }

  String _appendReferral(String url) {
    if (!url.contains("unsplash")) {
      return url;
    }

    if (url.contains("?")) {
      return "$url&utm_source=free_images_search&utm_medium=referral";
    } else {
      return "$url?utm_source=free_images_search&utm_medium=referral";
    }
  }
}
