// Flutter Imports
import 'package:flutter/material.dart';

// Package Imports
import 'package:shimmer/shimmer.dart';

class PhotoTileShimmer extends StatelessWidget {
  const PhotoTileShimmer(
      {super.key, required this.width, required this.height});

  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.black26,
      highlightColor: Colors.black12,
      child: Container(
        width: width,
        height: height,
        color: Colors.black,
      ),
    );
  }
}
