// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'AlbumObject.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AlbumRestrictionObject _$AlbumRestrictionObjectFromJson(
    Map<String, dynamic> json) {
  return AlbumRestrictionObject(
    reason: json['reason'] as String,
  );
}

AlbumObject _$AlbumObjectFromJson(Map<String, dynamic> json) {
  return AlbumObject(
    error: json['error'] == null
        ? null
        : ErrorObject.fromJson(json['error'] as Map<String, dynamic>),
    albumType: json['album_type'] as String,
    artists: (json['artists'] as List)
        ?.map((e) => e == null
            ? null
            : SimplifiedArtistObject.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    availableMarkets:
        (json['available_markets'] as List)?.map((e) => e as String)?.toList(),
    copyrights: (json['copyrights'] as List)
        ?.map((e) => e == null
            ? null
            : CopyrightObject.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    externalIDs: json['external_ids'] as Map<String, dynamic>,
    externalURLs: json['external_urls'] as Map<String, dynamic>,
    genres: (json['genres'] as List)?.map((e) => e as String)?.toList(),
    href: json['href'] as String,
    id: json['id'] as String,
    images: (json['images'] as List)
        ?.map((e) =>
            e == null ? null : ImageObject.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    label: json['label'] as String,
    name: json['name'] as String,
    popularity: json['popularity'] as int,
    releaseDate: json['release_date'] as String,
    releaseDatePrecision: json['release_date_precision'] as String,
  )..tracks = json['tracks'] == null
      ? null
      : PagingObject.fromJson(json['tracks'] as Map<String, dynamic>);
}

SimplifiedAlbumObject _$SimplifiedAlbumObjectFromJson(
    Map<String, dynamic> json) {
  return SimplifiedAlbumObject(
    error: json['error'] == null
        ? null
        : ErrorObject.fromJson(json['error'] as Map<String, dynamic>),
    albumGroup: json['album_group'] as String,
    albumType: json['album_type'] as String,
    artists: (json['artists'] as List)
        ?.map((e) => e == null
            ? null
            : SimplifiedArtistObject.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    availableMarkets:
        (json['available_markets'] as List)?.map((e) => e as String)?.toList(),
    externalURLs: json['external_urls'] as Map<String, dynamic>,
    href: json['href'] as String,
    id: json['id'] as String,
    images: (json['images'] as List)
        ?.map((e) =>
            e == null ? null : ImageObject.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    name: json['name'] as String,
    releaseDate: json['release_date'] as String,
    releaseDatePrecision: json['release_date_precision'] as String,
    restrictions: json['restrictions'] as Map<String, dynamic>,
    type: json['type'] as String,
    uri: json['uri'] as String,
  );
}
