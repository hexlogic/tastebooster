import 'dart:convert';

import 'package:meta/meta.dart';
import 'package:tastebooster/data/spotify/Common.dart';
import 'package:tastebooster/data/spotify/models/PagingObject.dart';
import 'package:tastebooster/data/spotify/models/PrimitiveObjects.dart';

class Library {
  static Future<PagingObject> getCurrentUsersSavedAlbums({
    @required String accessToken,
    int limit = 20,
    int offset = 0,
    String market,
  }) async {
    var r = await CommonActions.requestToSpotifyGET(
        accessToken: accessToken,
        path: 'me/albums',
        params: {
          'limit': limit.toString(),
          'offset': offset.toString(),
          'market': market,
        });

    var json = jsonDecode(r.body);
    ErrorObject.checkForError(json);
    return PagingObject.fromJson(json);
  }

  static Future<PagingObject> getCurrentUsersSavedTracks({
    @required String accessToken,
    int limit = 20,
    int offset = 0,
    String market,
  }) async {
    var r = await CommonActions.requestToSpotifyGET(
        accessToken: accessToken,
        path: 'me/tracks',
        params: {
          'limit': limit.toString(),
          'offset': offset.toString(),
          'market': market,
        });
    var json = jsonDecode(r.body);
    ErrorObject.checkForError(json);

    return PagingObject.fromJson(json);
  }

  static Future saveTracksForUser<T>({
    @required String accessToken,
    @required List<String> trackIDs,
  }) async {
    var r = await CommonActions.requestToSpotifyPUT(
        accessToken: accessToken,
        path: 'me/tracks',
        params: {'ids': trackIDs.join(',')});

    if (r.statusCode == 200)
      return r.statusCode;
    else {
      var json = jsonDecode(r.body);
      if (json['error'] != null) ErrorObject.checkForError(json);
    }
  }
}
