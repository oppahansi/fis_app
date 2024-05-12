// Flutter Imports
import 'package:flutter_riverpod/flutter_riverpod.dart';

final pageProvider = StateProvider<int>((ref) {
  return 1;
});

final totalPagesProvider = StateProvider<int>((ref) {
  return 1;
});
