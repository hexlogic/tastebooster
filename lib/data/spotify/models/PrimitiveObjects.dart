
import 'package:json_annotation/json_annotation.dart';
import 'package:tastebooster/data/spotify/Exceptions.dart';
import 'package:tastebooster/data/spotify/models/AlbumObject.dart';
import 'package:tastebooster/data/spotify/models/TrackObject.dart';

part 'PrimitiveObjects.g.dart';

@JsonSerializable(createToJson: false)
class ImageObject {
  int height;
  int width;
  String url;

  ImageObject({this.height, this.url, this.width});

  factory ImageObject.fromJson(Map<String, dynamic> json) =>
      _$ImageObjectFromJson(json);
}

@JsonSerializable(createToJson: false)
class CategoryObject {
  String href;
  List<ImageObject> icons;
  String id;
  String name;
  CategoryObject({
    this.href,
    this.icons,
    this.id,
    this.name,
  });

  factory CategoryObject.fromJson(Map<String, dynamic> json) =>
      _$CategoryObjectFromJson(json);
}

@JsonSerializable(createToJson: false)
class ContextObject {
  String type;
  String href;
  @JsonKey(name: "external_urls")
  Map externalURLs;
  String uri;
  ContextObject({
    this.type,
    this.href,
    this.externalURLs,
    this.uri,
  });

  factory ContextObject.fromJson(Map<String, dynamic> json) =>
      _$ContextObjectFromJson(json);
}

@JsonSerializable(createToJson: false)
class CopyrightObject {
  String text;
  String type;
  CopyrightObject({
    this.text,
    this.type,
  });

  factory CopyrightObject.fromJson(Map<String, dynamic> json) =>
      _$CopyrightObjectFromJson(json);
}

@JsonSerializable(createToJson: false)
class CursorObject {
  String after;
  CursorObject({
    this.after,
  });

  factory CursorObject.fromJson(Map<String, dynamic> json) =>
      _$CursorObjectFromJson(json);
}

@JsonSerializable(createToJson: false, nullable: true)
class ErrorObject {
  int status;
  String message;
  ErrorObject({
    this.status,
    this.message,
  });

  static void checkForError(var json) {
    if (json['error'] != null)
      throw SpotifyException(error: ErrorObject.fromJson(json['error']));
  }

  factory ErrorObject.fromJson(Map<String, dynamic> json) =>
      _$ErrorObjectFromJson(json);
}

@JsonSerializable(createToJson: false)
class FollowersObject {
  String href;
  int total;
  FollowersObject({
    this.href,
    this.total,
  });

  factory FollowersObject.fromJson(Map<String, dynamic> json) =>
      _$FollowersObjectFromJson(json);
}

@JsonSerializable(createToJson: false, includeIfNull: false)
class TrackLink {
  @JsonKey(name: "external_urls")
  final Map externalURLs;
  final String href;
  final String id;
  final String type;
  final String uri;
  TrackLink({
    this.externalURLs,
    this.href,
    this.id,
    this.type,
    this.uri,
  });

  factory TrackLink.fromJson(Map<String, dynamic> json) =>
      _$TrackLinkFromJson(json);
}

@JsonSerializable(createToJson: false)
class SavedTrackObject {
  @JsonKey(name: "added_at")
  DateTime addedAt;
  TrackObject track;
  SavedTrackObject({
    this.addedAt,
    this.track,
  });
  factory SavedTrackObject.fromJson(Map<String, dynamic> json) =>
      _$SavedTrackObjectFromJson(json);
}

@JsonSerializable(createToJson: false)
class SavedAlbumObject {
  @JsonKey(name: "added_at")
  DateTime addedAt;
  AlbumObject album;
  SavedAlbumObject({
    this.addedAt,
    this.album,
  });
  factory SavedAlbumObject.fromJson(Map<String, dynamic> json) =>
      _$SavedAlbumObjectFromJson(json);
}

@JsonSerializable(createToJson: false)
class ExplicitContentSettingsObject {
  @JsonKey(name: "filter_enabled")
  bool filterEnabled;
  @JsonKey(name: "filter_locked")
  bool filterLocked;
  ExplicitContentSettingsObject({
    this.filterEnabled,
    this.filterLocked,
  });
  factory ExplicitContentSettingsObject.fromJson(Map<String, dynamic> json) =>
      _$ExplicitContentSettingsObjectFromJson(json);
}
