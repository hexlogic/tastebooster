import 'package:json_annotation/json_annotation.dart';

import 'package:tastebooster/data/spotify/models/PrimitiveObjects.dart';

part 'UserObject.g.dart';

@JsonSerializable(createToJson: false)
class PublicUserObject {
  @JsonKey(includeIfNull: false)
  ErrorObject error;
  @JsonKey(name: "display_name")
  String displayName;
  @JsonKey(name: "external_urls")
  Map externalURLs;
  FollowersObject followers;
  String href;
  String id;
  List<ImageObject> images;
  String type;
  String uri;
  PublicUserObject({
    this.error,
    this.displayName,
    this.externalURLs,
    this.followers,
    this.href,
    this.id,
    this.images,
    this.type,
    this.uri,
  });

  factory PublicUserObject.fromJson(Map<String, dynamic> json) =>
      _$PublicUserObjectFromJson(json);
}

@JsonSerializable(createToJson: false)
class PrivateUserObject {
  @JsonKey(includeIfNull: false)
  ErrorObject error;
  String country;
  @JsonKey(name: "display_name")
  String displayName;
  String email;
  @JsonKey(name: "explicit_content")
  ExplicitContentSettingsObject explicitContent;
  @JsonKey(name: "external_urls")
  Map externalURLs;
  FollowersObject followers;
  String href;
  String id;
  List<ImageObject> images;
  String product;
  String type;
  String uri;
  PrivateUserObject({
    this.error,
    this.country,
    this.displayName,
    this.email,
    this.explicitContent,
    this.externalURLs,
    this.followers,
    this.href,
    this.id,
    this.images,
    this.product,
    this.type,
    this.uri,
  });

  factory PrivateUserObject.fromJson(Map<String, dynamic> json) =>
      _$PrivateUserObjectFromJson(json);
}
