// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fis_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$fisRepoHash() => r'39a3269b9c57ea9e954e982146b95f5ecf6d8b89';

/// See also [fisRepo].
@ProviderFor(fisRepo)
final fisRepoProvider = AutoDisposeProvider<FisRepository>.internal(
  fisRepo,
  name: r'fisRepoProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$fisRepoHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef FisRepoRef = AutoDisposeProviderRef<FisRepository>;
String _$searchPhotosHash() => r'10a15cccd6342d454568ae311b1c66bd2eeacbc2';

/// Provider to fetch paginated movies data
///
/// Copied from [searchPhotos].
@ProviderFor(searchPhotos)
final searchPhotosProvider = AutoDisposeFutureProvider<FisResult>.internal(
  searchPhotos,
  name: r'searchPhotosProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$searchPhotosHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef SearchPhotosRef = AutoDisposeFutureProviderRef<FisResult>;
String _$fetchCuratedHash() => r'60bb7ed2140d13c0cf5a8324a61340a75f69a262';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// See also [fetchCurated].
@ProviderFor(fetchCurated)
const fetchCuratedProvider = FetchCuratedFamily();

/// See also [fetchCurated].
class FetchCuratedFamily extends Family<AsyncValue<FisResult>> {
  /// See also [fetchCurated].
  const FetchCuratedFamily();

  /// See also [fetchCurated].
  FetchCuratedProvider call({
    required ResultsPagination pagination,
  }) {
    return FetchCuratedProvider(
      pagination: pagination,
    );
  }

  @override
  FetchCuratedProvider getProviderOverride(
    covariant FetchCuratedProvider provider,
  ) {
    return call(
      pagination: provider.pagination,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'fetchCuratedProvider';
}

/// See also [fetchCurated].
class FetchCuratedProvider extends AutoDisposeFutureProvider<FisResult> {
  /// See also [fetchCurated].
  FetchCuratedProvider({
    required ResultsPagination pagination,
  }) : this._internal(
          (ref) => fetchCurated(
            ref as FetchCuratedRef,
            pagination: pagination,
          ),
          from: fetchCuratedProvider,
          name: r'fetchCuratedProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$fetchCuratedHash,
          dependencies: FetchCuratedFamily._dependencies,
          allTransitiveDependencies:
              FetchCuratedFamily._allTransitiveDependencies,
          pagination: pagination,
        );

  FetchCuratedProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.pagination,
  }) : super.internal();

  final ResultsPagination pagination;

  @override
  Override overrideWith(
    FutureOr<FisResult> Function(FetchCuratedRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: FetchCuratedProvider._internal(
        (ref) => create(ref as FetchCuratedRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        pagination: pagination,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<FisResult> createElement() {
    return _FetchCuratedProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FetchCuratedProvider && other.pagination == pagination;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, pagination.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin FetchCuratedRef on AutoDisposeFutureProviderRef<FisResult> {
  /// The parameter `pagination` of this provider.
  ResultsPagination get pagination;
}

class _FetchCuratedProviderElement
    extends AutoDisposeFutureProviderElement<FisResult> with FetchCuratedRef {
  _FetchCuratedProviderElement(super.provider);

  @override
  ResultsPagination get pagination =>
      (origin as FetchCuratedProvider).pagination;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
