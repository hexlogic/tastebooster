import 'package:json_annotation/json_annotation.dart';

import 'package:tastebooster/data/spotify/models/PrimitiveObjects.dart';

part 'ShowObject.g.dart';

@JsonSerializable(createToJson: false)
class SavedShowObject {
  @JsonKey(name: "added_at")
  DateTime addedAt;
  SimplifiedShowObject show;
  SavedShowObject({
    this.addedAt,
    this.show,
  });
  factory SavedShowObject.fromJson(Map<String, dynamic> json) =>
      _$SavedShowObjectFromJson(json);
}

@JsonSerializable(createToJson: false)
class SimplifiedShowObject {
  @JsonKey(includeIfNull: false)
  ErrorObject error;
  @JsonKey(name: "available_markets")
  List<String> availableMarkets;
  CopyrightObject copyright;
  String description;
  bool explicit;
  @JsonKey(name: "external_urls")
  Map externalURLs;
  String href;
  String id;
  List<ImageObject> images;
  @JsonKey(name: "is_externally_hosted")
  bool isExternallyHosted;
  List<String> languages;
  @JsonKey(name: "media_type")
  String mediaType;
  String name;
  String publisher;
  String type;
  String uri;
  SimplifiedShowObject({
    this.error,
    this.availableMarkets,
    this.copyright,
    this.description,
    this.explicit,
    this.externalURLs,
    this.href,
    this.id,
    this.images,
    this.isExternallyHosted,
    this.languages,
    this.mediaType,
    this.name,
    this.publisher,
    this.type,
    this.uri,
  });

  factory SimplifiedShowObject.fromJson(Map<String, dynamic> json) =>
      _$SimplifiedShowObjectFromJson(json);
}

//TODO: Full episode object
