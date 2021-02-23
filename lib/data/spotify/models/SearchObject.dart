import 'package:json_annotation/json_annotation.dart';

import 'package:tastebooster/data/spotify/models/PagingObject.dart';
import 'package:tastebooster/data/spotify/models/PrimitiveObjects.dart';

part 'SearchObject.g.dart';

@JsonSerializable(createToJson: false)
class SearchObject {
  @JsonKey(includeIfNull: false)
  ErrorObject error;
  PagingObject artists;
  PagingObject albums;
  PagingObject playlists;
  PagingObject tracks;
  SearchObject({
    this.error,
    this.artists,
    this.albums,
    this.playlists,
    this.tracks,
  });
  factory SearchObject.fromJson(Map<String, dynamic> json) =>
      _$SearchObjectFromJson(json);
}
