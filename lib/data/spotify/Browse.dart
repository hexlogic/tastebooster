import 'dart:convert';

import 'package:meta/meta.dart';
import 'package:tastebooster/data/spotify/Common.dart';
import 'package:tastebooster/data/spotify/models/PrimitiveObjects.dart';
import 'package:tastebooster/data/spotify/models/RecommendationsObject.dart';

class Browse {
  static Future<RecommendationsObject> getRecommendationsBasedOnSeeds({
    @required String accessToken,
    @required List<String> seedTracksID,
    String market,
    double targetAcousticness,
    double targetDanceability,
    int targetDurationMS,
    double targetEnergy,
    double targetinstrumentalness,
    int targetMode,
    double targetLiveness,
    double targetLoudness,
    double targetSpeechiness,
    int targetPopularity,
    double targetTempo,
    double targetValence,
    int targetTimeSignature,
    int limit,
  }) async {
    var params = {
      'seed_tracks': seedTracksID.join(','),
      'target_acousticness': targetAcousticness.toString(),
      'target_duration_ms': targetDurationMS.toString(),
      'target_energy': targetEnergy.toString(),
      'target_instrumentalness': targetinstrumentalness.toString(),
      'target_mode': targetMode.toString(),
      'target_liveness': targetLiveness.toString(),
      'target_loudness': targetLoudness.toString(),
      'target_speechiness': targetSpeechiness.toString(),
      'target_popularity': targetPopularity.toString(),
      'target_tempo': targetTempo.toString(),
      'target_valence': targetValence.toString(),
      'target_time_signature': targetTimeSignature.toString(),
      'market': market,
      'limit': limit.toString(),
    };
    var r = await CommonActions.requestToSpotifyGET(
        accessToken: accessToken, path: 'recommendations', params: params);

    var json = jsonDecode(r.body);
    ErrorObject.checkForError(json);
    return RecommendationsObject.fromJson(json);
  }
}
