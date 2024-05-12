// Dart Imports
import 'dart:math';

// Flutter Imports
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

// Package Imports
import 'package:url_launcher/url_launcher.dart';

extension AsLink on TextSpan {
  TextSpan asLink(BuildContext context, String text, String url) {
    return TextSpan(
      text: text,
      style: TextStyle(
        color: Theme.of(context).colorScheme.secondary,
        decoration: TextDecoration.underline,
      ),
      recognizer: TapGestureRecognizer()
        ..onTap = () => launchUrl(Uri.parse(url)),
    );
  }
}

extension RandomElement<T> on List<T> {
  T get randomElement {
    if (isEmpty) {
      throw StateError('Cannot get a random element of an empty list');
    }
    return this[Random().nextInt(length)];
  }
}
