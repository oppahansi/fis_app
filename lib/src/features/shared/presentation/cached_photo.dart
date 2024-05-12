// Flutter Imports
import 'package:flutter/material.dart';

// Package Imports
import 'package:cached_network_image/cached_network_image.dart';
import 'package:shimmer/shimmer.dart';

class CachedPhoto extends StatelessWidget {
  const CachedPhoto({super.key, this.imagePath});
  final String? imagePath;

  static const width = 350.0;
  static const height = 350.0;

  @override
  Widget build(BuildContext context) {
    if (imagePath != null) {
      return CachedNetworkImage(
        //fit: BoxFit.fitWidth,
        imageUrl: imagePath!,
        placeholder: (_, __) => Shimmer.fromColors(
          baseColor: Colors.black26,
          highlightColor: Colors.black12,
          child: Container(
            width: width,
            height: height,
            color: Colors.black,
          ),
        ),
      );
    }
    return const Placeholder(
      color: Colors.black87,
    );
  }
}
