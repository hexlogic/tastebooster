import 'package:tastebooster/data/spotify/models/TrackObject.dart';

class GameContentProvider {
  List<SimplifiedTrackObject> _gameTracks = [];

  List<SimplifiedTrackObject> get gameTracks => _gameTracks;

  void setGameTracks(List<SimplifiedTrackObject> tracks) {
    _gameTracks = tracks;
  }
}
