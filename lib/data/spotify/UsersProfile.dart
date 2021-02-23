import 'dart:convert';
import 'package:meta/meta.dart';

import 'package:tastebooster/data/spotify/Common.dart';
import 'package:tastebooster/data/spotify/models/PrimitiveObjects.dart';
import 'package:tastebooster/data/spotify/models/UserObject.dart';

class UsersProfile {
  static Future<PrivateUserObject> getCurrentUsersProfile(
      {@required String accessToken}) async {
    var r = await CommonActions.requestToSpotifyGET(
        accessToken: accessToken, path: 'me');
    var json = jsonDecode(r.body);
    ErrorObject.checkForError(json);
    return PrivateUserObject.fromJson(json);
  }

  static Future<PublicUserObject> getAUsersProfile(
      {@required String accessToken, @required String userID}) async {
    var r = await CommonActions.requestToSpotifyGET(
        accessToken: accessToken, path: 'users/$userID');

    var json = jsonDecode(r.body);
    ErrorObject.checkForError(json);
    return PublicUserObject.fromJson(json);
  }
}
