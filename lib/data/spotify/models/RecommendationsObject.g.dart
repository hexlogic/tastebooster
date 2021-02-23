// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'RecommendationsObject.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SeedObject _$SeedObjectFromJson(Map<String, dynamic> json) {
  return SeedObject()
    ..afterFilteringSize = json['afterFilteringSize'] as int
    ..afterRelinkingSize = json['afterRelinkingSize'] as int
    ..href = json['href'] as String
    ..id = json['id'] as String
    ..initialPoolSize = json['initialPoolSize'] as int
    ..type = json['type'] as String;
}

RecommendationsObject _$RecommendationsObjectFromJson(
    Map<String, dynamic> json) {
  return RecommendationsObject()
    ..tracks = (json['tracks'] as List)
        ?.map((e) => e == null
            ? null
            : SimplifiedTrackObject.fromJson(e as Map<String, dynamic>))
        ?.toList()
    ..seeds = (json['seeds'] as List)
        ?.map((e) =>
            e == null ? null : SeedObject.fromJson(e as Map<String, dynamic>))
        ?.toList();
}
