// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'PrimitiveObjects.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ImageObject _$ImageObjectFromJson(Map<String, dynamic> json) {
  return ImageObject(
    height: json['height'] as int,
    url: json['url'] as String,
    width: json['width'] as int,
  );
}

CategoryObject _$CategoryObjectFromJson(Map<String, dynamic> json) {
  return CategoryObject(
    href: json['href'] as String,
    icons: (json['icons'] as List)
        ?.map((e) =>
            e == null ? null : ImageObject.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    id: json['id'] as String,
    name: json['name'] as String,
  );
}

ContextObject _$ContextObjectFromJson(Map<String, dynamic> json) {
  return ContextObject(
    type: json['type'] as String,
    href: json['href'] as String,
    externalURLs: json['external_urls'] as Map<String, dynamic>,
    uri: json['uri'] as String,
  );
}

CopyrightObject _$CopyrightObjectFromJson(Map<String, dynamic> json) {
  return CopyrightObject(
    text: json['text'] as String,
    type: json['type'] as String,
  );
}

CursorObject _$CursorObjectFromJson(Map<String, dynamic> json) {
  return CursorObject(
    after: json['after'] as String,
  );
}

ErrorObject _$ErrorObjectFromJson(Map<String, dynamic> json) {
  return ErrorObject(
    status: json['status'] as int,
    message: json['message'] as String,
  );
}

FollowersObject _$FollowersObjectFromJson(Map<String, dynamic> json) {
  return FollowersObject(
    href: json['href'] as String,
    total: json['total'] as int,
  );
}

TrackLink _$TrackLinkFromJson(Map<String, dynamic> json) {
  return TrackLink(
    externalURLs: json['external_urls'] as Map<String, dynamic>,
    href: json['href'] as String,
    id: json['id'] as String,
    type: json['type'] as String,
    uri: json['uri'] as String,
  );
}

SavedTrackObject _$SavedTrackObjectFromJson(Map<String, dynamic> json) {
  return SavedTrackObject(
    addedAt: json['added_at'] == null
        ? null
        : DateTime.parse(json['added_at'] as String),
    track: json['track'] == null
        ? null
        : TrackObject.fromJson(json['track'] as Map<String, dynamic>),
  );
}

SavedAlbumObject _$SavedAlbumObjectFromJson(Map<String, dynamic> json) {
  return SavedAlbumObject(
    addedAt: json['added_at'] == null
        ? null
        : DateTime.parse(json['added_at'] as String),
    album: json['album'] == null
        ? null
        : AlbumObject.fromJson(json['album'] as Map<String, dynamic>),
  );
}

ExplicitContentSettingsObject _$ExplicitContentSettingsObjectFromJson(
    Map<String, dynamic> json) {
  return ExplicitContentSettingsObject(
    filterEnabled: json['filter_enabled'] as bool,
    filterLocked: json['filter_locked'] as bool,
  );
}
