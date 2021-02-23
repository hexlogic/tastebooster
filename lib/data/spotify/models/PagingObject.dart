//

import 'package:json_annotation/json_annotation.dart';

import 'package:tastebooster/data/spotify/models/AlbumObject.dart';
import 'package:tastebooster/data/spotify/models/ArtistObject.dart';
import 'package:tastebooster/data/spotify/models/PlaylistObject.dart';
import 'package:tastebooster/data/spotify/models/PrimitiveObjects.dart';
import 'package:tastebooster/data/spotify/models/TrackObject.dart';

part 'PagingObject.g.dart';

@JsonSerializable(createToJson: false)
class PagingObject<T> {
  @JsonKey(includeIfNull: false)
  final ErrorObject error;
  final String href;
  @JsonKey(fromJson: _itemsFromJson)
  final T items;
  final int limit;
  final String next;
  final int offset;
  final String previous;
  final int total;
  const PagingObject({
    this.error,
    this.href,
    this.items,
    this.limit,
    this.next,
    this.offset,
    this.previous,
    this.total,
  });

  factory PagingObject.fromJson(Map<String, dynamic> json) =>
      _$PagingObjectFromJson(json);

  static T _itemsFromJson<T>(Object json) {
    if (json is List) {
      if (json.isEmpty) {
        return json as T;
      }
      if (json[0]['type'] == "album" && !json[0].containsKey('label'))
        return json
            .map((e) =>
                SimplifiedAlbumObject.fromJson(e as Map<String, dynamic>))
            .toList() as T;

      if (json[0]['type'] == "album" && json[0].containsKey('label'))
        return json
            .map((e) => AlbumObject.fromJson(e as Map<String, dynamic>))
            .toList() as T;

      if (json[0]['type'] == "playlist" && !json[0].containsKey('description'))
        return json
            .map((e) =>
                SimplifiedPlaylistObject.fromJson(e as Map<String, dynamic>))
            .toList() as T;

      if (json[0]['type'] == "playlist" && json[0].containsKey('description'))
        return json
            .map((e) => PlaylistObject.fromJson(e as Map<String, dynamic>))
            .toList() as T;

      if (json[0].containsKey('track') && json[0].containsKey('added_by'))
        return json
            .map((e) => PlaylistTrackObject.fromJson(e as Map<String, dynamic>))
            .toList() as T;

      if (json[0]['type'] == 'track' && !json[0].containsKey('album'))
        return json
            .map((e) =>
                SimplifiedTrackObject.fromJson(e as Map<String, dynamic>))
            .toList() as T;

      if (json[0]['type'] == 'track' && json[0].containsKey('album'))
        return json
            .map((e) => TrackObject.fromJson(e as Map<String, dynamic>))
            .toList() as T;

      if (json[0].containsKey('added_at') && json[0].containsKey('album'))
        return json
            .map((e) => SavedAlbumObject.fromJson(e as Map<String, dynamic>))
            .toList() as T;

      if (json[0].containsKey('added_at') && json[0].containsKey('track'))
        return json
            .map((e) => SavedTrackObject.fromJson(e as Map<String, dynamic>))
            .toList() as T;

      if (json[0]['type'] == "artist")
        return json
            .map((e) => ArtistObject.fromJson(e as Map<String, dynamic>))
            .toList() as T;
    }
    // } else if (json is Map<String, dynamic>) {
    //   if (json['type'] == "album" && !json.containsKey('label'))
    //     return SimplifiedAlbumObject.fromJson(json) as T;

    //   if (json['type'] == "album" && json.containsKey('label'))
    //     return AlbumObject.fromJson(json) as T;

    //   if (json['type'] == "playlist" && !json.containsKey('description'))
    //     return SimplifiedPlaylistObject.fromJson(json) as T;

    //   if (json['type'] == "playlist" && json.containsKey('description'))
    //     return PlaylistObject.fromJson(json) as T;

    //   if (json.containsKey('track') && json.containsKey('added_by'))
    //     return PlaylistTrackObject.fromJson(json) as T;

    //   if (json['type'] == 'track' && !json.containsKey('album'))
    //     return SimplifiedTrackObject.fromJson(json) as T;

    //   if (json['type'] == 'track' && json.containsKey('album'))
    //     return TrackObject.fromJson(json) as T;

    //   if (json.containsKey('added_at') && json.containsKey('album'))
    //     return SavedAlbumObject.fromJson(json) as T;

    //   if (json.containsKey('added_at') && json.containsKey('track'))
    //     return SavedTrackObject.fromJson(json) as T;
    // }

    throw ArgumentError.value(
      json,
      'json',
      'Cannot convert the provided data.',
    );
  }
}
