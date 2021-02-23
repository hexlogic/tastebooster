import 'package:json_annotation/json_annotation.dart';

import 'package:tastebooster/data/spotify/models/ArtistObject.dart';
import 'package:tastebooster/data/spotify/models/PagingObject.dart';
import 'package:tastebooster/data/spotify/models/PrimitiveObjects.dart';

part 'AlbumObject.g.dart';

@JsonSerializable(createToJson: false, nullable: true)
class AlbumRestrictionObject {
  String reason;
  AlbumRestrictionObject({
    this.reason,
  });
  factory AlbumRestrictionObject.fromJson(Map<String, dynamic> json) =>
      _$AlbumRestrictionObjectFromJson(json);
}

@JsonSerializable(createToJson: false)
class AlbumObject {
  @JsonKey(includeIfNull: false)
  ErrorObject error;
  @JsonKey(name: "album_type")
  String albumType;
  List<SimplifiedArtistObject> artists;
  @JsonKey(name: "available_markets")
  List<String> availableMarkets;
  List<CopyrightObject> copyrights;
  @JsonKey(name: "external_ids")
  Map externalIDs;
  @JsonKey(name: "external_urls")
  Map externalURLs;
  List<String> genres;
  String href;
  String id;
  List<ImageObject> images;
  String label;
  String name;
  int popularity;
  @JsonKey(name: "release_date")
  String releaseDate;
  @JsonKey(name: "release_date_precision")
  String releaseDatePrecision;
  PagingObject tracks;
  AlbumObject({
    this.error,
    this.albumType,
    this.artists,
    this.availableMarkets,
    this.copyrights,
    this.externalIDs,
    this.externalURLs,
    this.genres,
    this.href,
    this.id,
    this.images,
    this.label,
    this.name,
    this.popularity,
    this.releaseDate,
    this.releaseDatePrecision,
  });

  factory AlbumObject.fromJson(Map<String, dynamic> json) =>
      _$AlbumObjectFromJson(json);
}

@JsonSerializable(createToJson: false)
class SimplifiedAlbumObject {
  @JsonKey(includeIfNull: false)
  ErrorObject error;
  @JsonKey(name: "album_group")
  String albumGroup;
  @JsonKey(name: "album_type")
  String albumType;
  List<SimplifiedArtistObject> artists;
  @JsonKey(name: "available_markets")
  List<String> availableMarkets;
  @JsonKey(name: "external_urls")
  Map externalURLs;
  String href;
  String id;
  List<ImageObject> images;
  String name;
  @JsonKey(name: "release_date")
  String releaseDate;
  @JsonKey(name: "release_date_precision")
  String releaseDatePrecision;
  @JsonKey(includeIfNull: false)
  Map restrictions;
  String type;
  String uri;
  SimplifiedAlbumObject({
    this.error,
    this.albumGroup,
    this.albumType,
    this.artists,
    this.availableMarkets,
    this.externalURLs,
    this.href,
    this.id,
    this.images,
    this.name,
    this.releaseDate,
    this.releaseDatePrecision,
    this.restrictions,
    this.type,
    this.uri,
  });

  factory SimplifiedAlbumObject.fromJson(Map<String, dynamic> json) =>
      _$SimplifiedAlbumObjectFromJson(json);
}
