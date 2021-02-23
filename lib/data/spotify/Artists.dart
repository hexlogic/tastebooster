import 'dart:convert';

import 'package:tastebooster/data/spotify/Common.dart';
import 'package:tastebooster/data/spotify/models/ArtistObject.dart';
import 'package:meta/meta.dart';
import 'package:tastebooster/data/spotify/models/PrimitiveObjects.dart';

class Artists {
  static Future<ArtistObject> getAnArtist({
    @required String accessToken,
    @required String artistID,
  }) async {
    var r = await CommonActions.requestToSpotifyGET(
        accessToken: accessToken, path: 'artists/$artistID');
    var json = jsonDecode(r.body);
    ErrorObject.checkForError(json);
    return ArtistObject.fromJson(json);
  }

  static Stream<ArtistObject> getSeveralArtists({
    @required String accessToken,
    @required List<String> artistIDs,
  }) async* {
    var r = await CommonActions.requestToSpotifyGET(
      accessToken: accessToken,
      path: 'artists',
      params: {
        'ids': artistIDs.join(','),
      },
    );
    var json = jsonDecode(r.body);
    ErrorObject.checkForError(json);
    for (var artist in json['artists']) {
      yield ArtistObject.fromJson(artist);
    }
  }
}
