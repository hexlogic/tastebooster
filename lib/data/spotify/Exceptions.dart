import 'package:tastebooster/data/spotify/models/PrimitiveObjects.dart';

class SpotifyException implements Exception {
  ErrorObject error;
  SpotifyException({
    this.error,
  });
  @override
  String toString() {
    return "spotify throws an error with code ${error.status} and message: ${error.message}";
  }
}
