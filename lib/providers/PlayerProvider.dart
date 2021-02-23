import 'package:assets_audio_player/assets_audio_player.dart';

class PlayerProvider {
  final AssetsAudioPlayer _player = AssetsAudioPlayer.withId('0');

  void openPlaylist(List<Audio> tracklist) {
    _player.open(
      Playlist(audios: tracklist),
      loopMode: LoopMode.single,
      playInBackground: PlayInBackground.disabledRestoreOnForeground,
      showNotification: false,
    );
  }

  void stopPlayer() {
    _player.stop();
  }

  void playNextTrack() {
    _player.next();
  }

  void pausePlayer() {
    _player.playOrPause();
  }

  void disposePlayer() {
    _player.dispose();
  }

  Stream getPlayerCurrentPosition() {
    return _player.currentPosition;
  }

  double getTrackDuration() {
    return _player.current.value.audio.duration.inMilliseconds.toDouble();
  }
}
