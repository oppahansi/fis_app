// Flutter Imports
import 'package:flutter/foundation.dart';

// Package Imports
import 'package:freezed_annotation/freezed_annotation.dart';

part 'fis_result.freezed.dart';
part 'fis_result.g.dart';

@freezed
class FisResult with _$FisResult {
  const factory FisResult({
    int? total,
    int? page,
    int? perPage,
    int? perSource,
    SearchSource? searchSources,
    List<FisImage>? images,
  }) = _FisResult;

  factory FisResult.fromJson(Map<String, Object?> json) =>
      _$FisResultFromJson(json);

  factory FisResult.empty() => const FisResult(
        total: 0,
        page: 0,
        perPage: 0,
        perSource: 0,
        searchSources: SearchSource(unsplash: "", pixabay: "", pexels: ""),
        images: [],
      );
}

@freezed
class SearchSource with _$SearchSource {
  const factory SearchSource({
    String? unsplash,
    String? pixabay,
    String? pexels,
  }) = _SearchSources;

  factory SearchSource.fromJson(Map<String, Object?> json) =>
      _$SearchSourceFromJson(json);
}

@freezed
class FisImage with _$FisImage {
  const factory FisImage({
    String? url,
    String? preview,
    String? description,
    String? photographer,
    String? license,
    String? source,
  }) = _FisImage;

  factory FisImage.fromJson(Map<String, Object?> json) =>
      _$FisImageFromJson(json);
}
