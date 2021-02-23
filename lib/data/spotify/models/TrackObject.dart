import 'package:json_annotation/json_annotation.dart';

import 'package:tastebooster/data/spotify/models/AlbumObject.dart';
import 'package:tastebooster/data/spotify/models/ArtistObject.dart';
import 'package:tastebooster/data/spotify/models/PrimitiveObjects.dart';

part 'TrackObject.g.dart';

@JsonSerializable(createToJson: false, nullable: true)
class TrackRestrictionObject {
  String reason;
  TrackRestrictionObject({
    this.reason,
  });
  factory TrackRestrictionObject.fromJson(Map<String, dynamic> json) =>
      _$TrackRestrictionObjectFromJson(json);
}

@JsonSerializable(createToJson: false)
class TrackObject {
  @JsonKey(includeIfNull: false)
  ErrorObject error;
  final SimplifiedAlbumObject album;
  final List<SimplifiedArtistObject> artists;
  @JsonKey(name: 'available_markets')
  final List<String> availableMarkets;
  @JsonKey(name: "disk_number")
  final int discNumber;
  @JsonKey(name: "duration_ms")
  final int durationMS;
  final bool explicit;
  @JsonKey(name: "external_ids")
  final Map externalIDs;
  @JsonKey(name: "external_urls")
  final Map externalURLs;
  final String href;
  final String id;
  @JsonKey(name: "is_playable")
  final bool isPlayable;
  @JsonKey(nullable: true, name: "linked_from")
  final TrackLink linkedFrom;
  final String name;
  final int popularity;
  @JsonKey(name: "preview_url")
  final String previewURL;
  @JsonKey(name: "track_number")
  final int trackNumber;
  final String type;
  final String uri;
  @JsonKey(name: "is_local")
  final bool isLocal;
  TrackObject({
    this.error,
    this.album,
    this.artists,
    this.availableMarkets,
    this.discNumber,
    this.durationMS,
    this.explicit,
    this.externalIDs,
    this.externalURLs,
    this.href,
    this.id,
    this.isPlayable,
    this.linkedFrom,
    this.name,
    this.popularity,
    this.previewURL,
    this.trackNumber,
    this.type,
    this.uri,
    this.isLocal,
  });

  factory TrackObject.fromJson(Map<String, dynamic> json) =>
      _$TrackObjectFromJson(json);
}

@JsonSerializable(createToJson: false)
class SimplifiedTrackObject {
  @JsonKey(includeIfNull: false)
  ErrorObject error;
  List<SimplifiedArtistObject> artists;
  @JsonKey(name: "available_markets")
  List<String> availableMarkets;
  @JsonKey(name: "disk_number")
  int diskNumber;
  @JsonKey(name: "duration_ms")
  int durationMS;
  bool explicit;
  @JsonKey(name: "external_urls")
  Map externalURLs;
  String href;
  String id;
  @JsonKey(name: "is_playable")
  bool isPlayable;
  @JsonKey(nullable: true, name: "linked_from")
  TrackLink linkedFrom;
  String name;
  @JsonKey(name: "preview_url")
  String previewURL;
  @JsonKey(name: "track_number")
  int trackNumber;
  String type;
  String uri;
  @JsonKey(name: "is_local")
  bool isLocal;
  SimplifiedTrackObject({
    this.error,
    this.artists,
    this.availableMarkets,
    this.diskNumber,
    this.durationMS,
    this.explicit,
    this.externalURLs,
    this.href,
    this.id,
    this.isPlayable,
    this.linkedFrom,
    this.name,
    this.previewURL,
    this.trackNumber,
    this.type,
    this.uri,
    this.isLocal,
  });

  factory SimplifiedTrackObject.fromJson(Map<String, dynamic> json) =>
      _$SimplifiedTrackObjectFromJson(json);
}
