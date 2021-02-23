import 'dart:convert';

import 'package:tastebooster/data/spotify/Common.dart';
import 'package:tastebooster/data/spotify/models/PagingObject.dart';
import 'package:meta/meta.dart';
import 'package:tastebooster/data/spotify/models/PrimitiveObjects.dart';

class Personalization {
  static Future<PagingObject> getUsersTopArtistsAndTracks({
    @required String accessToken,
    @required String type,
    int limit = 20,
    int offset = 0,
    String timeRange = "medium_term",
  }) async {
    var params = {
      'limit': limit.toString(),
      'offset': offset.toString(),
      'time_range': timeRange,
    };

    var r = await CommonActions.requestToSpotifyGET(
        accessToken: accessToken, path: 'me/top/$type', params: params);
    var json = jsonDecode(r.body);
    ErrorObject.checkForError(json);
    return PagingObject.fromJson(json);
  }
}
