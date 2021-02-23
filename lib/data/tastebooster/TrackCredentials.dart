import 'package:tastebooster/data/spotify/models/PrimitiveObjects.dart';

class TrackCredentials {
  String previewURL;
  String trackID;
  String trackArtists;
  List<ImageObject> trackCover;
  TrackCredentials({
    this.previewURL,
    this.trackID,
    this.trackArtists,
    this.trackCover,
  });
}
