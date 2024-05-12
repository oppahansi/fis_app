// Dart Imports
import 'dart:async';

// Package Imports
import 'package:dio/dio.dart';
import 'package:riverpod/src/framework.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

// Project Imports
import 'package:fis_app/src/app/app.dart';
import 'package:fis_app/src/features/shared/shared.dart';

part 'fis_repository.g.dart';

class FisRepository {
  FisRepository({required this.client, required this.apiKey});
  final Dio client;
  final String apiKey;

  Future<FisResult> searchPhotos(
      {required int page, String query = '', CancelToken? cancelToken}) async {
    if (query.isEmpty) {
      return FisResult.empty();
    }

    final url = "$apiBaseLocal/search?query=$query&page=$page&perSource=10";

    final headers = <String, dynamic>{};
    if (apiBase.contains('ngrok')) {
      headers[ngrokSkipBrowserWarning] = 'skip-browser-warning';
    }

    final response = await client.get(
      url,
      cancelToken: cancelToken,
      options: Options(headers: headers),
    );

    final searchResult = FisResult.fromJson(response.data);
    return searchResult;
  }

  Future<FisResult> fetchCurated(
      {required int page, CancelToken? cancelToken}) async {
    final url = "$apiBaseLocal/curated?&page=$page&perSource=10";

    final headers = <String, dynamic>{};
    if (apiBase.contains('ngrok')) {
      headers[ngrokSkipBrowserWarning] = 'skip-browser-warning';
    }

    final response = await client.get(
      url,
      cancelToken: cancelToken,
      options: Options(headers: headers),
    );

    final curatedResult = FisResult.fromJson(response.data);
    return curatedResult;
  }
}

@riverpod
FisRepository fisRepo(FisRepoRef ref) => FisRepository(
      client: ref.watch(dioProvider),
      apiKey: "",
    );

class AbortedException implements Exception {}

/// Provider to fetch paginated movies data
@riverpod
Future<FisResult> searchPhotos(SearchPhotosRef ref) async {
  final fisRepo = ref.watch(fisRepoProvider);
  final page = ref.watch(pageProvider);
  final query = ref.watch(searchTextProvider);

  final cancelToken = CancelToken();
  final link = ref.keepAlive();
  Timer? timer;

  _setEvents(ref, cancelToken, timer, link);

  if (query.isEmpty) {
    return FisResult.empty();
  }

  if (cancelToken.isCancelled) {
    throw AbortedException();
  }

  return fisRepo.searchPhotos(
    page: page,
    query: query,
    cancelToken: cancelToken,
  );
}

@riverpod
Future<FisResult> fetchCurated(
  FetchCuratedRef ref, {
  required ResultsPagination pagination,
}) async {
  final fisRepo = ref.watch(fisRepoProvider);

  final cancelToken = CancelToken();
  final link = ref.keepAlive();
  Timer? timer;

  _setEvents(ref, cancelToken, timer, link);

  if (cancelToken.isCancelled) {
    throw AbortedException();
  }

  return fisRepo.fetchCurated(
    page: pagination.page,
    cancelToken: cancelToken,
  );
}

void _setEvents(AutoDisposeFutureProviderRef ref, CancelToken cancelToken,
    Timer? timer, KeepAliveLink link) {
  ref.onDispose(() {
    cancelToken.cancel();
    timer?.cancel();
  });

  ref.onCancel(() {
    timer = Timer(const Duration(seconds: 30), () {
      link.close();
    });
  });

  ref.onResume(() {
    timer?.cancel();
  });
}
