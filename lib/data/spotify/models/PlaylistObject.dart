import 'package:json_annotation/json_annotation.dart';

import 'package:tastebooster/data/spotify/models/EpisodeObject.dart';
import 'package:tastebooster/data/spotify/models/PrimitiveObjects.dart';
import 'package:tastebooster/data/spotify/models/TrackObject.dart';
import 'package:tastebooster/data/spotify/models/UserObject.dart';

part 'PlaylistObject.g.dart';

@JsonSerializable(createToJson: false)
class PlaylistObject {
  @JsonKey(includeIfNull: false)
  ErrorObject error;
  bool collaborative;
  String description;
  @JsonKey(name: "external_urls")
  Map externalURLs;
  FollowersObject followers;
  String href;
  String id;
  List<ImageObject> images;
  String name;
  PublicUserObject owner;
  @JsonKey(nullable: true)
  bool public;
  @JsonKey(name: "snapshot_id")
  String snapshotID;
  Map tracks;
  String type;
  String uri;
  PlaylistObject({
    this.error,
    this.collaborative,
    this.description,
    this.externalURLs,
    this.followers,
    this.href,
    this.id,
    this.images,
    this.name,
    this.owner,
    this.public,
    this.snapshotID,
    this.tracks,
    this.type,
    this.uri,
  });
  factory PlaylistObject.fromJson(Map<String, dynamic> json) =>
      _$PlaylistObjectFromJson(json);
}

@JsonSerializable(createToJson: false)
class SimplifiedPlaylistObject {
  @JsonKey(includeIfNull: false)
  ErrorObject error;
  bool collaborative;
  String description;
  @JsonKey(name: "external_urls")
  Map externalURLs;
  String href;
  String id;
  List<ImageObject> images;
  String name;
  PublicUserObject owner;
  @JsonKey(nullable: true)
  bool public;
  @JsonKey(name: "snapshot_id")
  String snapshotID;
  Map tracks;
  String type;
  String uri;
  SimplifiedPlaylistObject({
    this.error,
    this.collaborative,
    this.description,
    this.externalURLs,
    this.href,
    this.id,
    this.images,
    this.name,
    this.owner,
    this.public,
    this.snapshotID,
    this.tracks,
    this.type,
    this.uri,
  });

  factory SimplifiedPlaylistObject.fromJson(Map<String, dynamic> json) =>
      _$SimplifiedPlaylistObjectFromJson(json);
}

@JsonSerializable(createToJson: false)
class PlaylistTrackObject<T> {
  ErrorObject error;
  @JsonKey(name: "added_at", nullable: true)
  DateTime addedAt;
  @JsonKey(name: "added_by", nullable: true)
  PublicUserObject addedBy;
  @JsonKey(name: "is_local")
  bool isLocal;
  @JsonKey(fromJson: _trackFromJson, nullable: true)
  T track;
  PlaylistTrackObject({
    this.error,
    this.addedAt,
    this.addedBy,
    this.isLocal,
    this.track,
  });

  static T _trackFromJson<T>(Object json) {
    if (json is Map<String, dynamic>) {
      if (json == null) {
        return {} as T;
      }
      if (json['type'] == "track") {
        return TrackObject.fromJson(json) as T;
      } else {
        return SimplifiedEpisodeObject.fromJson(json) as T;
      }
    }

    // throw ArgumentError.value(
    //   json,
    //   'json',
    //   'Cannot convert the provided track.',
    // );
  }

  factory PlaylistTrackObject.fromJson(Map<String, dynamic> json) =>
      _$PlaylistTrackObjectFromJson(json);
}
