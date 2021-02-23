import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:tastebooster/data/tastebooster/Tastebooster.dart';

const AUTH_TOKEN =
    "BQAziBkzWmDYLdDOtf7O9XiSXBn8jiBXi6zgBzqbvA02tGTpGPaEHuVM_CjXZc8sBREclQGQ0LjBCcOGitk33MoS2fzSQ4ZJ7vAyfTjmiVKsDOTxg15P27VD4zGuBQ6gATDBCfTl9Zazc_CS9Ihglb6c7XZtIZkXhSwVUBzKodQGcrXN4K4Kj0BRJuBTEdKa4dIlK8WdLk8rhiKJ8hFeB7vxS0GFZmanN5JIZtfBhFjlraAB0wGZoRSD8UTaiGHKK10yh-3nIl_jx0XiiiA";
void main() {
  var genres;
  List<String> soundTracklist = [];
  var pulseTracklist = [];
  var edgeTracklist = [];
  var tsbtInstance = SpotifyBackend();
  var freshlySqueezedTracklist = [];

  var seedsTracklist = [];
  // test('Get full user preferred genres', () async {
  //   genres = await tsbtInstance.getUsersPreferredGenres(AUTH_TOKEN);
  //   expectLater(genres, isA<List<String>>());
  //   print(genres);
  // });

  test('Get full recommendation tracklist', () async {
    // tracklist = await tsbtInstance.getTracklistBasedOnGenres(
    //     accessToken: AUTH_TOKEN, userGenres: genres);
    // expectLater(tracklist, isA<List<TrackObject>>());
    // for (var track in tracklist) {
    //   List<String> artists = [];
    //   track.artists.forEach((element) {
    //     artists.add(element.name);
    //   });
    //   print("${artists.join(',')} - ${track.name}");
    // }

    // await for (var track in tsbtInstance.getTheSoundOfGenres(
    //     accessToken: AUTH_TOKEN, userGenres: genres)) {
    //   if (track.popularity > 50) {
    //     List<String> artists = [];
    //     track.artists.forEach((element) {
    //       artists.add(element.name);
    //     });
    //     var trackTitle = "${artists.join(',')} - ${track.name}";
    //     if (!soundTracklist.contains(trackTitle)) {
    //       soundTracklist.add(trackTitle);
    //       print(trackTitle);
    //     }
    //   }
    // }
    // await for (var track in tsbtInstance.getThePulseOfGenres(
    //     accessToken: AUTH_TOKEN, userGenres: genres)) {
    //   if (track.popularity > 50) {
    //     List<String> artists = [];
    //     track.artists.forEach((element) {
    //       artists.add(element.name);
    //     });
    //     var trackTitle = "${artists.join(',')} - ${track.name}";
    //     if (!pulseTracklist.contains(trackTitle)) {
    //       pulseTracklist.add(trackTitle);
    //       print(trackTitle);
    //     }
    //   }
    // }

    // await for (var track in tsbtInstance.getTheEdgeOfGenres(
    //     accessToken: AUTH_TOKEN, userGenres: genres)) {
    //   if (track.popularity > 50) {
    //     List<String> artists = [];
    //     track.artists.forEach((element) {
    //       artists.add(element.name);
    //     });
    //     var trackTitle = "${artists.join(',')} - ${track.name}";
    //     if (!edgeTracklist.contains(trackTitle)) {
    //       edgeTracklist.add(trackTitle);
    //       print(trackTitle);
    //     }
    //   }
    // }

    // await for (var track in tsbtInstance.userLibraryFilter(
    //     userLibrary: tsbtInstance.getUserLibrary(AUTH_TOKEN),
    //     recommendations: tsbtInstance.getRecommendationsBasedOnTopTracks(
    //         accessToken: AUTH_TOKEN, market: "from_token"))) {
    //   List<String> artists = [];
    //   track.artists.forEach((element) {
    //     artists.add(element.name);
    //   });
    //   var trackTitle = "${artists.join(',')} - ${track.name}";
    //   if (!seedsTracklist.contains(trackTitle)) {
    //     seedsTracklist.add(trackTitle);
    //     print(trackTitle);
    //   }
      
    // }

    // await for (var track in tsbtInstance.getFreshlySqueezedTracksByGenres(
    //     accessToken: AUTH_TOKEN, userGenres: genres)) {
    //   if (track.popularity > 10) {
    //     List<String> artists = [];
    //     track.artists.forEach((element) {
    //       artists.add(element.name);
    //     });
    //     var trackTitle = "${artists.join(',')} - ${track.name}";
    //     if (!freshlySqueezedTracklist.contains(trackTitle)) {
    //       freshlySqueezedTracklist.add(trackTitle);
    //       print(trackTitle);
    //     }
    //   }
    // }
    // await File('freshlySqueezed.txt')
    //     .writeAsString(freshlySqueezedTracklist.join('\n'));
    // await File('theSoundOf.txt').writeAsString(soundTracklist.join('\n'));
    // await File('thePulseOf.txt').writeAsString(pulseTracklist.join('\n'));
    // await File('theEdgeOf.txt').writeAsString(edgeTracklist.join('\n'));
    await File('seedTracks.txt').writeAsString(seedsTracklist.join('\n'));
  }, timeout: Timeout(Duration(minutes: 30)));
}
