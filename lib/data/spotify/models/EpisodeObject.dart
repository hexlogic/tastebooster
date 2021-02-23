import 'package:json_annotation/json_annotation.dart';

import 'package:tastebooster/data/spotify/models/PrimitiveObjects.dart';
import 'package:tastebooster/data/spotify/models/ShowObject.dart';

part 'EpisodeObject.g.dart';

@JsonSerializable(createToJson: false)
class SimplifiedEpisodeObject {
  @JsonKey(includeIfNull: false)
  ErrorObject error;
  @JsonKey(name: "audio_preview_url")
  String audioPreviewURL;
  String description;
  @JsonKey(name: "duration_ms")
  int durationMS;
  bool explicit;
  @JsonKey(name: "external_urls")
  Map externalURLs;
  String href;
  String id;
  List<ImageObject> images;
  @JsonKey(name: "is_externally_hosted")
  bool isExternallyHosted;
  @JsonKey(name: "is_playable")
  bool isPlayable;
  List<String> languages;
  String name;
  @JsonKey(name: "release_date")
  String releaseDate;
  @JsonKey(name: "release_date_precision")
  String releaseDatePrecision;
  @JsonKey(name: "resume_point")
  ResumePoint resumePoint;
  String type;
  String uri;
  SimplifiedEpisodeObject({
    this.error,
    this.audioPreviewURL,
    this.description,
    this.durationMS,
    this.explicit,
    this.externalURLs,
    this.href,
    this.id,
    this.images,
    this.isExternallyHosted,
    this.isPlayable,
    this.languages,
    this.name,
    this.releaseDate,
    this.releaseDatePrecision,
    this.resumePoint,
    this.type,
    this.uri,
  });

  factory SimplifiedEpisodeObject.fromJson(Map<String, dynamic> json) =>
      _$SimplifiedEpisodeObjectFromJson(json);
}

@JsonSerializable(createToJson: false)
class EpisodeObject {
  @JsonKey(includeIfNull: false)
  ErrorObject error;
  @JsonKey(name: "audio_preview_url")
  String audioPreviewURL;
  String description;
  @JsonKey(name: "duration_ms")
  int durationMS;
  bool explicit;
  @JsonKey(name: "external_urls")
  Map externalURLs;
  String href;
  String id;
  List<ImageObject> images;
  @JsonKey(name: "is_externally_hosted")
  bool isExternallyHosted;
  @JsonKey(name: "is_playable")
  bool isPlayable;
  List<String> languages;
  String name;
  @JsonKey(name: "release_date")
  String releaseDate;
  @JsonKey(name: "release_date_precision")
  String releaseDatePrecision;
  @JsonKey(name: "resume_point")
  ResumePoint resumePoint;
  String type;
  String uri;
  SimplifiedShowObject show;
  EpisodeObject({
    this.error,
    this.audioPreviewURL,
    this.description,
    this.durationMS,
    this.explicit,
    this.externalURLs,
    this.href,
    this.id,
    this.images,
    this.isExternallyHosted,
    this.isPlayable,
    this.languages,
    this.name,
    this.releaseDate,
    this.releaseDatePrecision,
    this.resumePoint,
    this.type,
    this.uri,
    this.show,
  });

  factory EpisodeObject.fromJson(Map<String, dynamic> json) =>
      _$EpisodeObjectFromJson(json);
}

@JsonSerializable(createToJson: false)
class ResumePoint {
  @JsonKey(name: "fully_played")
  bool fullyPlayed;
  @JsonKey(name: "resume_position_ms")
  int resumePositionMS;
  ResumePoint({
    this.fullyPlayed,
    this.resumePositionMS,
  });

  factory ResumePoint.fromJson(Map<String, dynamic> json) =>
      _$ResumePointFromJson(json);
}
