// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'PlaylistObject.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PlaylistObject _$PlaylistObjectFromJson(Map<String, dynamic> json) {
  return PlaylistObject(
    error: json['error'] == null
        ? null
        : ErrorObject.fromJson(json['error'] as Map<String, dynamic>),
    collaborative: json['collaborative'] as bool,
    description: json['description'] as String,
    externalURLs: json['external_urls'] as Map<String, dynamic>,
    followers: json['followers'] == null
        ? null
        : FollowersObject.fromJson(json['followers'] as Map<String, dynamic>),
    href: json['href'] as String,
    id: json['id'] as String,
    images: (json['images'] as List)
        ?.map((e) =>
            e == null ? null : ImageObject.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    name: json['name'] as String,
    owner: json['owner'] == null
        ? null
        : PublicUserObject.fromJson(json['owner'] as Map<String, dynamic>),
    public: json['public'] as bool,
    snapshotID: json['snapshot_id'] as String,
    tracks: json['tracks'] as Map<String, dynamic>,
    type: json['type'] as String,
    uri: json['uri'] as String,
  );
}

SimplifiedPlaylistObject _$SimplifiedPlaylistObjectFromJson(
    Map<String, dynamic> json) {
  return SimplifiedPlaylistObject(
    error: json['error'] == null
        ? null
        : ErrorObject.fromJson(json['error'] as Map<String, dynamic>),
    collaborative: json['collaborative'] as bool,
    description: json['description'] as String,
    externalURLs: json['external_urls'] as Map<String, dynamic>,
    href: json['href'] as String,
    id: json['id'] as String,
    images: (json['images'] as List)
        ?.map((e) =>
            e == null ? null : ImageObject.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    name: json['name'] as String,
    owner: json['owner'] == null
        ? null
        : PublicUserObject.fromJson(json['owner'] as Map<String, dynamic>),
    public: json['public'] as bool,
    snapshotID: json['snapshot_id'] as String,
    tracks: json['tracks'] as Map<String, dynamic>,
    type: json['type'] as String,
    uri: json['uri'] as String,
  );
}

PlaylistTrackObject<T> _$PlaylistTrackObjectFromJson<T>(
    Map<String, dynamic> json) {
  return PlaylistTrackObject<T>(
    error: json['error'] == null
        ? null
        : ErrorObject.fromJson(json['error'] as Map<String, dynamic>),
    addedAt: json['added_at'] == null
        ? null
        : DateTime.parse(json['added_at'] as String),
    addedBy: json['added_by'] == null
        ? null
        : PublicUserObject.fromJson(json['added_by'] as Map<String, dynamic>),
    isLocal: json['is_local'] as bool,
    track: PlaylistTrackObject._trackFromJson(json['track']),
  );
}
