// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'fis_result.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

FisResult _$FisResultFromJson(Map<String, dynamic> json) {
  return _FisResult.fromJson(json);
}

/// @nodoc
mixin _$FisResult {
  int? get total => throw _privateConstructorUsedError;
  int? get page => throw _privateConstructorUsedError;
  int? get perPage => throw _privateConstructorUsedError;
  int? get perSource => throw _privateConstructorUsedError;
  SearchSource? get searchSources => throw _privateConstructorUsedError;
  List<FisImage>? get images => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FisResultCopyWith<FisResult> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FisResultCopyWith<$Res> {
  factory $FisResultCopyWith(FisResult value, $Res Function(FisResult) then) =
      _$FisResultCopyWithImpl<$Res, FisResult>;
  @useResult
  $Res call(
      {int? total,
      int? page,
      int? perPage,
      int? perSource,
      SearchSource? searchSources,
      List<FisImage>? images});

  $SearchSourceCopyWith<$Res>? get searchSources;
}

/// @nodoc
class _$FisResultCopyWithImpl<$Res, $Val extends FisResult>
    implements $FisResultCopyWith<$Res> {
  _$FisResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? total = freezed,
    Object? page = freezed,
    Object? perPage = freezed,
    Object? perSource = freezed,
    Object? searchSources = freezed,
    Object? images = freezed,
  }) {
    return _then(_value.copyWith(
      total: freezed == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int?,
      page: freezed == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int?,
      perPage: freezed == perPage
          ? _value.perPage
          : perPage // ignore: cast_nullable_to_non_nullable
              as int?,
      perSource: freezed == perSource
          ? _value.perSource
          : perSource // ignore: cast_nullable_to_non_nullable
              as int?,
      searchSources: freezed == searchSources
          ? _value.searchSources
          : searchSources // ignore: cast_nullable_to_non_nullable
              as SearchSource?,
      images: freezed == images
          ? _value.images
          : images // ignore: cast_nullable_to_non_nullable
              as List<FisImage>?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $SearchSourceCopyWith<$Res>? get searchSources {
    if (_value.searchSources == null) {
      return null;
    }

    return $SearchSourceCopyWith<$Res>(_value.searchSources!, (value) {
      return _then(_value.copyWith(searchSources: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$FisResultImplCopyWith<$Res>
    implements $FisResultCopyWith<$Res> {
  factory _$$FisResultImplCopyWith(
          _$FisResultImpl value, $Res Function(_$FisResultImpl) then) =
      __$$FisResultImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? total,
      int? page,
      int? perPage,
      int? perSource,
      SearchSource? searchSources,
      List<FisImage>? images});

  @override
  $SearchSourceCopyWith<$Res>? get searchSources;
}

/// @nodoc
class __$$FisResultImplCopyWithImpl<$Res>
    extends _$FisResultCopyWithImpl<$Res, _$FisResultImpl>
    implements _$$FisResultImplCopyWith<$Res> {
  __$$FisResultImplCopyWithImpl(
      _$FisResultImpl _value, $Res Function(_$FisResultImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? total = freezed,
    Object? page = freezed,
    Object? perPage = freezed,
    Object? perSource = freezed,
    Object? searchSources = freezed,
    Object? images = freezed,
  }) {
    return _then(_$FisResultImpl(
      total: freezed == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int?,
      page: freezed == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int?,
      perPage: freezed == perPage
          ? _value.perPage
          : perPage // ignore: cast_nullable_to_non_nullable
              as int?,
      perSource: freezed == perSource
          ? _value.perSource
          : perSource // ignore: cast_nullable_to_non_nullable
              as int?,
      searchSources: freezed == searchSources
          ? _value.searchSources
          : searchSources // ignore: cast_nullable_to_non_nullable
              as SearchSource?,
      images: freezed == images
          ? _value._images
          : images // ignore: cast_nullable_to_non_nullable
              as List<FisImage>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FisResultImpl with DiagnosticableTreeMixin implements _FisResult {
  const _$FisResultImpl(
      {this.total,
      this.page,
      this.perPage,
      this.perSource,
      this.searchSources,
      final List<FisImage>? images})
      : _images = images;

  factory _$FisResultImpl.fromJson(Map<String, dynamic> json) =>
      _$$FisResultImplFromJson(json);

  @override
  final int? total;
  @override
  final int? page;
  @override
  final int? perPage;
  @override
  final int? perSource;
  @override
  final SearchSource? searchSources;
  final List<FisImage>? _images;
  @override
  List<FisImage>? get images {
    final value = _images;
    if (value == null) return null;
    if (_images is EqualUnmodifiableListView) return _images;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'FisResult(total: $total, page: $page, perPage: $perPage, perSource: $perSource, searchSources: $searchSources, images: $images)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'FisResult'))
      ..add(DiagnosticsProperty('total', total))
      ..add(DiagnosticsProperty('page', page))
      ..add(DiagnosticsProperty('perPage', perPage))
      ..add(DiagnosticsProperty('perSource', perSource))
      ..add(DiagnosticsProperty('searchSources', searchSources))
      ..add(DiagnosticsProperty('images', images));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FisResultImpl &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.perPage, perPage) || other.perPage == perPage) &&
            (identical(other.perSource, perSource) ||
                other.perSource == perSource) &&
            (identical(other.searchSources, searchSources) ||
                other.searchSources == searchSources) &&
            const DeepCollectionEquality().equals(other._images, _images));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, total, page, perPage, perSource,
      searchSources, const DeepCollectionEquality().hash(_images));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FisResultImplCopyWith<_$FisResultImpl> get copyWith =>
      __$$FisResultImplCopyWithImpl<_$FisResultImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FisResultImplToJson(
      this,
    );
  }
}

abstract class _FisResult implements FisResult {
  const factory _FisResult(
      {final int? total,
      final int? page,
      final int? perPage,
      final int? perSource,
      final SearchSource? searchSources,
      final List<FisImage>? images}) = _$FisResultImpl;

  factory _FisResult.fromJson(Map<String, dynamic> json) =
      _$FisResultImpl.fromJson;

  @override
  int? get total;
  @override
  int? get page;
  @override
  int? get perPage;
  @override
  int? get perSource;
  @override
  SearchSource? get searchSources;
  @override
  List<FisImage>? get images;
  @override
  @JsonKey(ignore: true)
  _$$FisResultImplCopyWith<_$FisResultImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

SearchSource _$SearchSourceFromJson(Map<String, dynamic> json) {
  return _SearchSources.fromJson(json);
}

/// @nodoc
mixin _$SearchSource {
  String? get unsplash => throw _privateConstructorUsedError;
  String? get pixabay => throw _privateConstructorUsedError;
  String? get pexels => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SearchSourceCopyWith<SearchSource> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchSourceCopyWith<$Res> {
  factory $SearchSourceCopyWith(
          SearchSource value, $Res Function(SearchSource) then) =
      _$SearchSourceCopyWithImpl<$Res, SearchSource>;
  @useResult
  $Res call({String? unsplash, String? pixabay, String? pexels});
}

/// @nodoc
class _$SearchSourceCopyWithImpl<$Res, $Val extends SearchSource>
    implements $SearchSourceCopyWith<$Res> {
  _$SearchSourceCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? unsplash = freezed,
    Object? pixabay = freezed,
    Object? pexels = freezed,
  }) {
    return _then(_value.copyWith(
      unsplash: freezed == unsplash
          ? _value.unsplash
          : unsplash // ignore: cast_nullable_to_non_nullable
              as String?,
      pixabay: freezed == pixabay
          ? _value.pixabay
          : pixabay // ignore: cast_nullable_to_non_nullable
              as String?,
      pexels: freezed == pexels
          ? _value.pexels
          : pexels // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SearchSourcesImplCopyWith<$Res>
    implements $SearchSourceCopyWith<$Res> {
  factory _$$SearchSourcesImplCopyWith(
          _$SearchSourcesImpl value, $Res Function(_$SearchSourcesImpl) then) =
      __$$SearchSourcesImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? unsplash, String? pixabay, String? pexels});
}

/// @nodoc
class __$$SearchSourcesImplCopyWithImpl<$Res>
    extends _$SearchSourceCopyWithImpl<$Res, _$SearchSourcesImpl>
    implements _$$SearchSourcesImplCopyWith<$Res> {
  __$$SearchSourcesImplCopyWithImpl(
      _$SearchSourcesImpl _value, $Res Function(_$SearchSourcesImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? unsplash = freezed,
    Object? pixabay = freezed,
    Object? pexels = freezed,
  }) {
    return _then(_$SearchSourcesImpl(
      unsplash: freezed == unsplash
          ? _value.unsplash
          : unsplash // ignore: cast_nullable_to_non_nullable
              as String?,
      pixabay: freezed == pixabay
          ? _value.pixabay
          : pixabay // ignore: cast_nullable_to_non_nullable
              as String?,
      pexels: freezed == pexels
          ? _value.pexels
          : pexels // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SearchSourcesImpl
    with DiagnosticableTreeMixin
    implements _SearchSources {
  const _$SearchSourcesImpl({this.unsplash, this.pixabay, this.pexels});

  factory _$SearchSourcesImpl.fromJson(Map<String, dynamic> json) =>
      _$$SearchSourcesImplFromJson(json);

  @override
  final String? unsplash;
  @override
  final String? pixabay;
  @override
  final String? pexels;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SearchSource(unsplash: $unsplash, pixabay: $pixabay, pexels: $pexels)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'SearchSource'))
      ..add(DiagnosticsProperty('unsplash', unsplash))
      ..add(DiagnosticsProperty('pixabay', pixabay))
      ..add(DiagnosticsProperty('pexels', pexels));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SearchSourcesImpl &&
            (identical(other.unsplash, unsplash) ||
                other.unsplash == unsplash) &&
            (identical(other.pixabay, pixabay) || other.pixabay == pixabay) &&
            (identical(other.pexels, pexels) || other.pexels == pexels));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, unsplash, pixabay, pexels);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SearchSourcesImplCopyWith<_$SearchSourcesImpl> get copyWith =>
      __$$SearchSourcesImplCopyWithImpl<_$SearchSourcesImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SearchSourcesImplToJson(
      this,
    );
  }
}

abstract class _SearchSources implements SearchSource {
  const factory _SearchSources(
      {final String? unsplash,
      final String? pixabay,
      final String? pexels}) = _$SearchSourcesImpl;

  factory _SearchSources.fromJson(Map<String, dynamic> json) =
      _$SearchSourcesImpl.fromJson;

  @override
  String? get unsplash;
  @override
  String? get pixabay;
  @override
  String? get pexels;
  @override
  @JsonKey(ignore: true)
  _$$SearchSourcesImplCopyWith<_$SearchSourcesImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

FisImage _$FisImageFromJson(Map<String, dynamic> json) {
  return _FisImage.fromJson(json);
}

/// @nodoc
mixin _$FisImage {
  String? get url => throw _privateConstructorUsedError;
  String? get preview => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  String? get photographer => throw _privateConstructorUsedError;
  String? get license => throw _privateConstructorUsedError;
  String? get source => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FisImageCopyWith<FisImage> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FisImageCopyWith<$Res> {
  factory $FisImageCopyWith(FisImage value, $Res Function(FisImage) then) =
      _$FisImageCopyWithImpl<$Res, FisImage>;
  @useResult
  $Res call(
      {String? url,
      String? preview,
      String? description,
      String? photographer,
      String? license,
      String? source});
}

/// @nodoc
class _$FisImageCopyWithImpl<$Res, $Val extends FisImage>
    implements $FisImageCopyWith<$Res> {
  _$FisImageCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? url = freezed,
    Object? preview = freezed,
    Object? description = freezed,
    Object? photographer = freezed,
    Object? license = freezed,
    Object? source = freezed,
  }) {
    return _then(_value.copyWith(
      url: freezed == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
      preview: freezed == preview
          ? _value.preview
          : preview // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      photographer: freezed == photographer
          ? _value.photographer
          : photographer // ignore: cast_nullable_to_non_nullable
              as String?,
      license: freezed == license
          ? _value.license
          : license // ignore: cast_nullable_to_non_nullable
              as String?,
      source: freezed == source
          ? _value.source
          : source // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FisImageImplCopyWith<$Res>
    implements $FisImageCopyWith<$Res> {
  factory _$$FisImageImplCopyWith(
          _$FisImageImpl value, $Res Function(_$FisImageImpl) then) =
      __$$FisImageImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? url,
      String? preview,
      String? description,
      String? photographer,
      String? license,
      String? source});
}

/// @nodoc
class __$$FisImageImplCopyWithImpl<$Res>
    extends _$FisImageCopyWithImpl<$Res, _$FisImageImpl>
    implements _$$FisImageImplCopyWith<$Res> {
  __$$FisImageImplCopyWithImpl(
      _$FisImageImpl _value, $Res Function(_$FisImageImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? url = freezed,
    Object? preview = freezed,
    Object? description = freezed,
    Object? photographer = freezed,
    Object? license = freezed,
    Object? source = freezed,
  }) {
    return _then(_$FisImageImpl(
      url: freezed == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
      preview: freezed == preview
          ? _value.preview
          : preview // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      photographer: freezed == photographer
          ? _value.photographer
          : photographer // ignore: cast_nullable_to_non_nullable
              as String?,
      license: freezed == license
          ? _value.license
          : license // ignore: cast_nullable_to_non_nullable
              as String?,
      source: freezed == source
          ? _value.source
          : source // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FisImageImpl with DiagnosticableTreeMixin implements _FisImage {
  const _$FisImageImpl(
      {this.url,
      this.preview,
      this.description,
      this.photographer,
      this.license,
      this.source});

  factory _$FisImageImpl.fromJson(Map<String, dynamic> json) =>
      _$$FisImageImplFromJson(json);

  @override
  final String? url;
  @override
  final String? preview;
  @override
  final String? description;
  @override
  final String? photographer;
  @override
  final String? license;
  @override
  final String? source;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'FisImage(url: $url, preview: $preview, description: $description, photographer: $photographer, license: $license, source: $source)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'FisImage'))
      ..add(DiagnosticsProperty('url', url))
      ..add(DiagnosticsProperty('preview', preview))
      ..add(DiagnosticsProperty('description', description))
      ..add(DiagnosticsProperty('photographer', photographer))
      ..add(DiagnosticsProperty('license', license))
      ..add(DiagnosticsProperty('source', source));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FisImageImpl &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.preview, preview) || other.preview == preview) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.photographer, photographer) ||
                other.photographer == photographer) &&
            (identical(other.license, license) || other.license == license) &&
            (identical(other.source, source) || other.source == source));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, url, preview, description, photographer, license, source);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FisImageImplCopyWith<_$FisImageImpl> get copyWith =>
      __$$FisImageImplCopyWithImpl<_$FisImageImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FisImageImplToJson(
      this,
    );
  }
}

abstract class _FisImage implements FisImage {
  const factory _FisImage(
      {final String? url,
      final String? preview,
      final String? description,
      final String? photographer,
      final String? license,
      final String? source}) = _$FisImageImpl;

  factory _FisImage.fromJson(Map<String, dynamic> json) =
      _$FisImageImpl.fromJson;

  @override
  String? get url;
  @override
  String? get preview;
  @override
  String? get description;
  @override
  String? get photographer;
  @override
  String? get license;
  @override
  String? get source;
  @override
  @JsonKey(ignore: true)
  _$$FisImageImplCopyWith<_$FisImageImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
