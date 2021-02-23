import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tastebooster/data/spotify/Artists.dart';
import 'package:tastebooster/data/spotify/Browse.dart';
import 'package:meta/meta.dart';
import 'package:tastebooster/data/spotify/Library.dart';
import 'package:tastebooster/data/spotify/Personalization.dart';
import 'package:tastebooster/data/spotify/Playlists.dart';
import 'package:tastebooster/data/spotify/Search.dart';
import 'package:tastebooster/data/spotify/models/ArtistObject.dart';
import 'package:tastebooster/data/spotify/models/PagingObject.dart';
import 'package:tastebooster/data/spotify/models/PlaylistObject.dart';
import 'package:tastebooster/data/spotify/models/PrimitiveObjects.dart';
import 'package:tastebooster/data/spotify/models/RecommendationsObject.dart';
import 'package:tastebooster/data/spotify/models/TrackObject.dart';
import 'package:tastebooster/providers/DatabaseProvider.dart';

class Tastebooster {
  static Future<List<SimplifiedTrackObject>> getGameTrackIDs(
      {String accessToken, String userID, DatabaseHelper helper}) async {
    List<SimplifiedTrackObject> tracks = [];
    //db working data
    var likedTracks = await helper.queryAllLikedTrack(userID);
    var blockedTracks = await helper.queryAllBlockedTrack(userID);
    SpotifyBackend tasteboosterInstance = SpotifyBackend();
    await for (var track
        in tasteboosterInstance.getRecommendationsBasedOnTopTracks(
      accessToken: accessToken,
      market: "from_token",
    )) {
      if (track.previewURL != null) {
        tracks.add(track);
      }
    }

    // removing duplicates
    if (likedTracks != null) {
      for (var track in likedTracks)
        tracks.removeWhere((element) => element.id == track.trackId);
    }
    if (blockedTracks != null) {
      for (var track in blockedTracks)
        tracks.removeWhere((element) => element.id == track.trackId);
    }
    tracks.shuffle();
    return tracks;
  }
}

class SpotifyBackend {
  Stream<SavedTrackObject> getUserLibrary(String authToken) async* {
    try {
      int totalTracks = await Library.getCurrentUsersSavedTracks(
              accessToken: authToken, limit: 50)
          .then((value) => value.total);

      for (var i = 0; i < totalTracks; i += 50) {
        //userLibrary.addAll();
        for (var item in await Library.getCurrentUsersSavedTracks(
                accessToken: authToken, limit: 50, offset: i)
            .then((value) => value.items)) {
          yield item;
        }
      }
    } catch (e) {}
  }

  Stream<String> _getArtistsIDsFromUserLibrary(
      Stream<SavedTrackObject> stream) async* {
    await for (var value in stream) {
      for (var artistID in value.track.artists) {
        yield artistID.id;
      }
    }
  }

  Stream<ArtistObject> _getFullArtistObjects(
      String authToken, Stream<String> artistsList) async* {
    List<String> cachedArtistIDs = [];
    await for (var value in artistsList) {
      cachedArtistIDs.add(value);
      if (cachedArtistIDs.length == 50) {
        await for (var item in Artists.getSeveralArtists(
            accessToken: authToken, artistIDs: cachedArtistIDs)) {
          yield item;
        }
      }
    }
  }

  Future<List<String>> getUsersPreferredGenres(String authToken) async {
    List<String> genres = [];

    await for (var item in _getFullArtistObjects(
      authToken,
      _getArtistsIDsFromUserLibrary(
        getUserLibrary(authToken),
      ),
    )) {
      for (var genre in item.genres) {
        if (!genres.contains(genre)) {
          genres.add(genre);
        }
      }
    }

    return genres;
  }

  Stream<PlaylistObject> _getGenreBasedPlaylists(
      {String accessToken,
      List<String> genres,
      String playlistToLook,
      String userID}) async* {
    for (var genre in genres) {
      var searchResults = await Search.search(
          accessToken: accessToken,
          query: "$playlistToLook $genre",
          type: ['playlist']);
      if (!searchResults.playlists.items.isEmpty) {
        for (var playlist in searchResults.playlists.items) {
          if (playlist.owner.id == userID) {
            yield playlist;
          }
        }
      }
    }
  }

  Stream<TrackObject> _getFullTracklist({
    String accessToken,
    Stream<PlaylistObject> playlistStream,
  }) async* {
    await for (var item in playlistStream) {
      int tracksInTotal = await Playlists.getPlaylistsItems(
              accessToken: accessToken, playlistID: item.id)
          .then((value) => value.total);
      for (var i = 0; i < tracksInTotal; i += 100) {
        var playlist = await Playlists.getPlaylistsItems(
            accessToken: accessToken, playlistID: item.id, offset: i);
        for (var trackObject in playlist.items) {
          if (trackObject.track != null) yield trackObject.track;
        }
      }
    }
  }

  Stream<TrackObject> getTheSoundOfGenres(
      {String accessToken, List<String> userGenres}) async* {
    await for (var item in _getFullTracklist(
      accessToken: accessToken,
      playlistStream: _getGenreBasedPlaylists(
          accessToken: accessToken,
          genres: userGenres,
          playlistToLook: "the sound of",
          userID: "thesoundsofspotify"),
    )) {
      yield item;
    }
  }

  Stream<TrackObject> getThePulseOfGenres(
      {String accessToken, List<String> userGenres}) async* {
    await for (var item in _getFullTracklist(
      accessToken: accessToken,
      playlistStream: _getGenreBasedPlaylists(
          accessToken: accessToken,
          genres: userGenres,
          playlistToLook: "the pulse of",
          userID: "particledetector"),
    )) {
      yield item;
    }
  }

  Stream<TrackObject> getTheEdgeOfGenres(
      {String accessToken, List<String> userGenres}) async* {
    await for (var item in _getFullTracklist(
      accessToken: accessToken,
      playlistStream: _getGenreBasedPlaylists(
          accessToken: accessToken,
          genres: userGenres,
          playlistToLook: "the edge of",
          userID: "particledetector"),
    )) {
      yield item;
    }
  }

  Stream<TrackObject> getFreshlySqueezedTracksByGenres({
    String accessToken,
    List<String> userGenres,
  }) async* {
    for (var genre in userGenres) {
      int totalTracks = await Search.search(
          accessToken: accessToken,
          query: "genre:'$genre':new",
          type: ['track']).then((value) => value.tracks.total).catchError((e) {
        if (e.error.status == 404) return 0;
      });

      if (totalTracks != 0) {
        for (var i = 0; i < totalTracks; i += 50) {
          var searchResults = await Search.search(
            accessToken: accessToken,
            query: "genre:'$genre':new",
            type: ['track'],
            limit: 50,
            offset: i,
          );

          for (var item in searchResults.tracks.items) {
            yield item;
          }
        }
      }
    }
  }

  Stream<RecommendationsObject> getRecommendationsBasedOnTracks(
      {@required String accessToken,
      @required List<String> trackIDs,
      String market}) async* {
    List<String> bufferIDs = [];
    for (var i = 0; i < trackIDs.length; i++) {
      bufferIDs.add(trackIDs[i]);
      if (i % 5 == 0) {
        yield await Browse.getRecommendationsBasedOnSeeds(
            accessToken: accessToken,
            seedTracksID: bufferIDs,
            limit: 100,
            market: market);
        bufferIDs.clear();
      }
    }
  }

  Stream<SimplifiedTrackObject> getRecommendationsBasedOnTopTracks(
      {@required String accessToken, String market}) async* {
    PagingObject topTracks = await Personalization.getUsersTopArtistsAndTracks(
        accessToken: accessToken,
        type: 'tracks',
        limit: 50,
        timeRange: 'short_term');
    List<String> trackIDs = [];
    for (var item in topTracks.items) {
      trackIDs.add(item.id);
    }

    await for (var item in getRecommendationsBasedOnTracks(
        accessToken: accessToken, trackIDs: trackIDs, market: market)) {
      for (var track in item.tracks) {
        yield track;
      }
    }
  }

  Future<List<SimplifiedTrackObject>> userLibraryFilter(
      {Stream<SavedTrackObject> userLibrary,
      List<SimplifiedTrackObject> recommendations}) async {
    await for (var userTrack in userLibrary) {
      recommendations
          .removeWhere((element) => element.id == userTrack.track.id);
    }
    return recommendations;
  }
}
