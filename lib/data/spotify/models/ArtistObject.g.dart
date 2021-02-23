// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ArtistObject.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ArtistObject _$ArtistObjectFromJson(Map<String, dynamic> json) {
  return ArtistObject(
    error: json['error'] == null
        ? null
        : ErrorObject.fromJson(json['error'] as Map<String, dynamic>),
    externalUrls: json['external_urls'] as Map<String, dynamic>,
    followers: json['followers'] == null
        ? null
        : FollowersObject.fromJson(json['followers'] as Map<String, dynamic>),
    genres: (json['genres'] as List)?.map((e) => e as String)?.toList(),
    href: json['href'] as String,
    id: json['id'] as String,
    images: (json['images'] as List)
        ?.map((e) =>
            e == null ? null : ImageObject.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    name: json['name'] as String,
    popularity: json['popularity'] as int,
    type: json['type'] as String,
    uri: json['uri'] as String,
  );
}

SimplifiedArtistObject _$SimplifiedArtistObjectFromJson(
    Map<String, dynamic> json) {
  return SimplifiedArtistObject(
    externalUrls: json['external_urls'] as Map<String, dynamic>,
    href: json['href'] as String,
    id: json['id'] as String,
    name: json['name'] as String,
    type: json['type'] as String,
    uri: json['uri'] as String,
  )..error = json['error'] == null
      ? null
      : ErrorObject.fromJson(json['error'] as Map<String, dynamic>);
}
