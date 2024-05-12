// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fis_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FisResultImpl _$$FisResultImplFromJson(Map<String, dynamic> json) =>
    _$FisResultImpl(
      total: json['total'] as int?,
      page: json['page'] as int?,
      perPage: json['perPage'] as int?,
      perSource: json['perSource'] as int?,
      searchSources: json['searchSources'] == null
          ? null
          : SearchSource.fromJson(
              json['searchSources'] as Map<String, dynamic>),
      images: (json['images'] as List<dynamic>?)
          ?.map((e) => FisImage.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$FisResultImplToJson(_$FisResultImpl instance) =>
    <String, dynamic>{
      'total': instance.total,
      'page': instance.page,
      'perPage': instance.perPage,
      'perSource': instance.perSource,
      'searchSources': instance.searchSources,
      'images': instance.images,
    };

_$SearchSourcesImpl _$$SearchSourcesImplFromJson(Map<String, dynamic> json) =>
    _$SearchSourcesImpl(
      unsplash: json['unsplash'] as String?,
      pixabay: json['pixabay'] as String?,
      pexels: json['pexels'] as String?,
    );

Map<String, dynamic> _$$SearchSourcesImplToJson(_$SearchSourcesImpl instance) =>
    <String, dynamic>{
      'unsplash': instance.unsplash,
      'pixabay': instance.pixabay,
      'pexels': instance.pexels,
    };

_$FisImageImpl _$$FisImageImplFromJson(Map<String, dynamic> json) =>
    _$FisImageImpl(
      url: json['url'] as String?,
      preview: json['preview'] as String?,
      description: json['description'] as String?,
      photographer: json['photographer'] as String?,
      license: json['license'] as String?,
      source: json['source'] as String?,
    );

Map<String, dynamic> _$$FisImageImplToJson(_$FisImageImpl instance) =>
    <String, dynamic>{
      'url': instance.url,
      'preview': instance.preview,
      'description': instance.description,
      'photographer': instance.photographer,
      'license': instance.license,
      'source': instance.source,
    };
