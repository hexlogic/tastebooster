import 'dart:convert';

import 'package:tastebooster/data/spotify/Common.dart';
import 'package:tastebooster/data/spotify/models/PagingObject.dart';
import 'package:meta/meta.dart';
import 'package:tastebooster/data/spotify/models/PrimitiveObjects.dart';

class Playlists {
  static Future<PagingObject> getPlaylistsItems({
    @required String accessToken,
    @required String playlistID,
    int limit = 100,
    int offset = 0,
    String market,
  }) async {
    var r = await CommonActions.requestToSpotifyGET(
        accessToken: accessToken,
        path: 'playlists/$playlistID/tracks',
        params: {
          'limit': limit.toString(),
          'offset': offset.toString(),
          'market': market,
        });
    var json = jsonDecode(r.body);
    ErrorObject.checkForError(json);

    return PagingObject.fromJson(json);
  }
}
