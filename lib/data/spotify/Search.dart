import 'dart:convert';

import 'package:meta/meta.dart';
import 'package:tastebooster/data/spotify/Common.dart';
import 'package:tastebooster/data/spotify/models/PrimitiveObjects.dart';
import 'package:tastebooster/data/spotify/models/SearchObject.dart';

class Search {
  static Future<SearchObject> search({
    @required accessToken,
    @required query,
    @required List<String> type,
    String market,
    int limit = 20,
    int offset = 0,
  }) async {
    var r = await CommonActions.requestToSpotifyGET(
      accessToken: accessToken,
      path: 'search',
      params: {
        'q': query,
        'type': type.join(','),
        'market': market,
        'limit': limit.toString(),
        'offset': offset.toString(),
      },
    );
    var json = jsonDecode(r.body);
    ErrorObject.checkForError(json);

    return SearchObject.fromJson(json);
  }
}
