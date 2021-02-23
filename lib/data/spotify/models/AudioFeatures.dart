import 'package:json_annotation/json_annotation.dart';

import 'package:tastebooster/data/spotify/models/PrimitiveObjects.dart';

part 'AudioFeatures.g.dart';

@JsonSerializable(createToJson: false)
class AudioFeatures {
  @JsonKey(includeIfNull: false)
  ErrorObject error;
  double acousticness;
  @JsonKey(name: "analysis_url")
  String analysisURL;
  double danceability;
  @JsonKey(name: "duration_ms")
  int durationMS;
  double energy;
  String id;
  double instrumentalness;
  int key;
  double liveness;
  double loudness;
  int mode;
  double speechiness;
  double tempo;
  @JsonKey(name: "time_signarure")
  int timeSignature;
  @JsonKey(name: "track_href")
  String trackHref;
  String type;
  String uri;
  double valence;
  AudioFeatures({
    this.error,
    this.acousticness,
    this.analysisURL,
    this.danceability,
    this.durationMS,
    this.energy,
    this.id,
    this.instrumentalness,
    this.key,
    this.liveness,
    this.loudness,
    this.mode,
    this.speechiness,
    this.tempo,
    this.timeSignature,
    this.trackHref,
    this.type,
    this.uri,
    this.valence,
  });

  factory AudioFeatures.fromJson(Map<String, dynamic> json) =>
      _$AudioFeaturesFromJson(json);
}
