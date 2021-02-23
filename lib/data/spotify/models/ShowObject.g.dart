// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ShowObject.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SavedShowObject _$SavedShowObjectFromJson(Map<String, dynamic> json) {
  return SavedShowObject(
    addedAt: json['added_at'] == null
        ? null
        : DateTime.parse(json['added_at'] as String),
    show: json['show'] == null
        ? null
        : SimplifiedShowObject.fromJson(json['show'] as Map<String, dynamic>),
  );
}

SimplifiedShowObject _$SimplifiedShowObjectFromJson(Map<String, dynamic> json) {
  return SimplifiedShowObject(
    error: json['error'] == null
        ? null
        : ErrorObject.fromJson(json['error'] as Map<String, dynamic>),
    availableMarkets:
        (json['available_markets'] as List)?.map((e) => e as String)?.toList(),
    copyright: json['copyright'] == null
        ? null
        : CopyrightObject.fromJson(json['copyright'] as Map<String, dynamic>),
    description: json['description'] as String,
    explicit: json['explicit'] as bool,
    externalURLs: json['external_urls'] as Map<String, dynamic>,
    href: json['href'] as String,
    id: json['id'] as String,
    images: (json['images'] as List)
        ?.map((e) =>
            e == null ? null : ImageObject.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    isExternallyHosted: json['is_externally_hosted'] as bool,
    languages: (json['languages'] as List)?.map((e) => e as String)?.toList(),
    mediaType: json['media_type'] as String,
    name: json['name'] as String,
    publisher: json['publisher'] as String,
    type: json['type'] as String,
    uri: json['uri'] as String,
  );
}
