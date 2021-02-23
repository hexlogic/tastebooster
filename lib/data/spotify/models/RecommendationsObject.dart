import 'package:json_annotation/json_annotation.dart';

import 'package:tastebooster/data/spotify/models/TrackObject.dart';

part 'RecommendationsObject.g.dart';

@JsonSerializable(createToJson: false)
class SeedObject {
  int afterFilteringSize;
  int afterRelinkingSize;
  String href;
  String id;
  int initialPoolSize;
  String type;
  SeedObject({
    this.afterFilteringSize,
    this.afterRelinkingSize,
    this.href,
    this.id,
    this.initialPoolSize,
    this.type,
  });
  factory SeedObject.fromJson(Map<String, dynamic> json) =>
      _$SeedObjectFromJson(json);
}

@JsonSerializable(createToJson: false)
class RecommendationsObject {
  List<SimplifiedTrackObject> tracks;
  List<SeedObject> seeds;
  RecommendationsObject({
    this.tracks,
    this.seeds,
  });

  factory RecommendationsObject.fromJson(Map<String, dynamic> json) =>
      _$RecommendationsObjectFromJson(json);
}
