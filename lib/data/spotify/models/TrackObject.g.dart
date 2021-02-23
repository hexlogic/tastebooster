// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'TrackObject.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TrackRestrictionObject _$TrackRestrictionObjectFromJson(
    Map<String, dynamic> json) {
  return TrackRestrictionObject(
    reason: json['reason'] as String,
  );
}

TrackObject _$TrackObjectFromJson(Map<String, dynamic> json) {
  return TrackObject(
    error: json['error'] == null
        ? null
        : ErrorObject.fromJson(json['error'] as Map<String, dynamic>),
    album: json['album'] == null
        ? null
        : SimplifiedAlbumObject.fromJson(json['album'] as Map<String, dynamic>),
    artists: (json['artists'] as List)
        ?.map((e) => e == null
            ? null
            : SimplifiedArtistObject.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    availableMarkets:
        (json['available_markets'] as List)?.map((e) => e as String)?.toList(),
    discNumber: json['disk_number'] as int,
    durationMS: json['duration_ms'] as int,
    explicit: json['explicit'] as bool,
    externalIDs: json['external_ids'] as Map<String, dynamic>,
    externalURLs: json['external_urls'] as Map<String, dynamic>,
    href: json['href'] as String,
    id: json['id'] as String,
    isPlayable: json['is_playable'] as bool,
    linkedFrom: json['linked_from'] == null
        ? null
        : TrackLink.fromJson(json['linked_from'] as Map<String, dynamic>),
    name: json['name'] as String,
    popularity: json['popularity'] as int,
    previewURL: json['preview_url'] as String,
    trackNumber: json['track_number'] as int,
    type: json['type'] as String,
    uri: json['uri'] as String,
    isLocal: json['is_local'] as bool,
  );
}

SimplifiedTrackObject _$SimplifiedTrackObjectFromJson(
    Map<String, dynamic> json) {
  return SimplifiedTrackObject(
    error: json['error'] == null
        ? null
        : ErrorObject.fromJson(json['error'] as Map<String, dynamic>),
    artists: (json['artists'] as List)
        ?.map((e) => e == null
            ? null
            : SimplifiedArtistObject.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    availableMarkets:
        (json['available_markets'] as List)?.map((e) => e as String)?.toList(),
    diskNumber: json['disk_number'] as int,
    durationMS: json['duration_ms'] as int,
    explicit: json['explicit'] as bool,
    externalURLs: json['external_urls'] as Map<String, dynamic>,
    href: json['href'] as String,
    id: json['id'] as String,
    isPlayable: json['is_playable'] as bool,
    linkedFrom: json['linked_from'] == null
        ? null
        : TrackLink.fromJson(json['linked_from'] as Map<String, dynamic>),
    name: json['name'] as String,
    previewURL: json['preview_url'] as String,
    trackNumber: json['track_number'] as int,
    type: json['type'] as String,
    uri: json['uri'] as String,
    isLocal: json['is_local'] as bool,
  );
}
