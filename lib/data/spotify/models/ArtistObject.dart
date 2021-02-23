import 'package:json_annotation/json_annotation.dart';

import 'package:tastebooster/data/spotify/models/PrimitiveObjects.dart';

part 'ArtistObject.g.dart';

@JsonSerializable(createToJson: false)
class ArtistObject {
  @JsonKey(includeIfNull: false)
  ErrorObject error;
  @JsonKey(name: "external_urls")
  Map externalUrls;
  FollowersObject followers;
  List<String> genres;
  String href;
  String id;
  List<ImageObject> images;
  String name;
  int popularity;
  String type;
  String uri;

  ArtistObject({
    this.error,
    this.externalUrls,
    this.followers,
    this.genres,
    this.href,
    this.id,
    this.images,
    this.name,
    this.popularity,
    this.type,
    this.uri,
  });

  factory ArtistObject.fromJson(Map<String, dynamic> json) =>
      _$ArtistObjectFromJson(json);
}

@JsonSerializable(createToJson: false)
class SimplifiedArtistObject {
  @JsonKey(includeIfNull: false)
  ErrorObject error;
  @JsonKey(name: "external_urls")
  Map externalUrls;
  String href;
  String id;
  String name;
  String type;
  String uri;

  SimplifiedArtistObject({
    this.externalUrls,
    this.href,
    this.id,
    this.name,
    this.type,
    this.uri,
  });

  factory SimplifiedArtistObject.fromJson(Map<String, dynamic> json) =>
      _$SimplifiedArtistObjectFromJson(json);
}
