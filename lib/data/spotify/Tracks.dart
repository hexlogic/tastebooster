import 'dart:convert';

import 'package:tastebooster/data/spotify/Common.dart';
import 'package:tastebooster/data/spotify/models/PrimitiveObjects.dart';
import 'package:tastebooster/data/spotify/models/TrackObject.dart';

class Tracks {
  static Future<TrackObject> getATrack(
      {String accessToken, String trackID}) async {
    var r = await CommonActions.requestToSpotifyGET(
        accessToken: accessToken, path: 'tracks/$trackID');
    var json = jsonDecode(r.body);
    ErrorObject.checkForError(json);
    return TrackObject.fromJson(json);
  }

  static Future<List<TrackObject>> getSeveralTracks({
    String accessToken,
    List<String> trackIDs,
  }) async {
    var r = await CommonActions.requestToSpotifyGET(
      accessToken: accessToken,
      path: 'tracks',
      params: {
        'ids': trackIDs.join(','),
      },
    );

    var json = jsonDecode(r.body);
    ErrorObject.checkForError(json);
    List<TrackObject> tracks = [];

    for (var track in json['tracks']) {
      tracks.add(TrackObject.fromJson(track));
    }

    return tracks;
  }
}
