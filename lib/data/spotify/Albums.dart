import 'dart:convert';

import 'package:meta/meta.dart';
import 'package:tastebooster/data/spotify/Common.dart';
import 'package:tastebooster/data/spotify/models/AlbumObject.dart';
import 'package:tastebooster/data/spotify/models/PagingObject.dart';
import 'package:tastebooster/data/spotify/models/PrimitiveObjects.dart';

class Albums {
  static Future<PagingObject> getAnAlbumsTracks({
    @required String accessToken,
    @required String albumID,
    String market,
    int limit = 20,
    int offset = 0,
  }) async {
    var r = await CommonActions.requestToSpotifyGET(
        accessToken: accessToken,
        path: "albums/$albumID/tracks",
        params: {
          'market': market,
          'limit': limit.toString(),
          'offset': offset.toString(),
        });

    var json = jsonDecode(r.body);
    ErrorObject.checkForError(json);
    return PagingObject.fromJson(json);
  }

  static Future<AlbumObject> getAnAlbum({
    @required String accessToken,
    @required String albumID,
    String market,
  }) async {
    var r = await CommonActions.requestToSpotifyGET(
        accessToken: accessToken,
        path: 'albums/$albumID',
        params: {
          'market': market,
        });

    var json = jsonDecode(r.body);
    ErrorObject.checkForError(json);
    return AlbumObject.fromJson(json);
  }
}
