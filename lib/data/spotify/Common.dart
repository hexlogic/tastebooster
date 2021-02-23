import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';

class CommonActions {
  static Future<http.Response> requestToSpotifyGET({
    @required String accessToken,
    @required String path,
    Map<String, String> params,
  }) async {
    params != null ? params.removeWhere((key, value) => value == null) : null;
    params != null ? params.removeWhere((key, value) => value == "null") : null;
    var headers = {"Authorization": "Bearer $accessToken"};
    Uri url = Uri.https("api.spotify.com", 'v1/$path', params);
    var response = await http.get(url, headers: headers);
    return response;
  }

  static Future<http.Response> requestToSpotifyPOST({
    @required String path,
    @required Map<String, String> headers,
    @required dynamic body,
    Map<String, String> params,
  }) async {
    Uri url = Uri.https("api.spotify.com", 'v1/$path', params);
    var response = await http.post(url, headers: headers, body: body);
    return response;
  }

  static Future<http.Response> requestToSpotifyPUT({
    @required String accessToken,
    @required String path,
    Map<String, String> headers,
    dynamic body,
    Map<String, String> params,
  }) async {
    Uri url = Uri.https("api.spotify.com", 'v1/$path', params);
    var response = await http.put(url,
        headers: headers ?? {"Authorization": "Bearer $accessToken"},
        body: body);
    return response;
  }

  static Future<http.Response> rawRequest(
      {@required String accessToken, @required String url}) async {
    return await http
        .put(url, headers: {"Authorization": "Bearer $accessToken"});
  }
}
