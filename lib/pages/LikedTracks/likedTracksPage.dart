import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tastebooster/pages/Settings/appConfig.dart';
import 'package:tastebooster/data/spotify/Tracks.dart';
import 'package:tastebooster/data/spotify/models/TrackObject.dart';
import 'package:tastebooster/providers/AuthCredentialsProvider.dart';
import 'package:tastebooster/providers/DatabaseProvider.dart';
import 'package:provider/provider.dart';

class LikedTracksPage extends StatelessWidget {
  Future<List<LikedTrackListTile>> loadLikedTracksList({
    String accessToken,
    String userId,
  }) async {
    List<LikedTrackListTile> widgetTracklist = [];
    DatabaseHelper helper = DatabaseHelper.instance;
    List<String> bufferTrackIDs = [];
    List<UserTrack> likedTrackFromDB = await helper.queryAllLikedTrack(userId);
    likedTrackFromDB.sort((b, a) => a.id.compareTo(b.id));

    likedTrackFromDB.forEach((element) {
      if (bufferTrackIDs.length != 50) {
        bufferTrackIDs.add(element.trackId);
      }
    });

    List<TrackObject> tracks = await Tracks.getSeveralTracks(
        accessToken: accessToken, trackIDs: bufferTrackIDs);
    for (var track in tracks) {
      List<String> artistNames = [];
      track.artists.forEach((element) {
        artistNames.add(element.name);
      });
      widgetTracklist.add(LikedTrackListTile(
        artistName: artistNames.join(', '),
        cover: track.album.images != null
            ? Image.network(track.album.images[0].url)
            : Image.asset("assets/icon/tastebooster_logo_barcode.png"),
        trackTitle: track.name,
      ));
    }

    return widgetTracklist;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AppBarTitle(
          title: "Liked Tracks",
        ),
      ),
      body: FutureBuilder<List<LikedTrackListTile>>(
        future: loadLikedTracksList(
            accessToken: context.watch<AuthCredentialsProvider>().authToken,
            userId: context.watch<AuthCredentialsProvider>().userID),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView(
              children: snapshot.data,
            );
          } else {
            return LinearProgressIndicator();
          }
        },
      ),
    );
  }
}

class LikedTrackListTile extends StatelessWidget {
  const LikedTrackListTile(
      {Key key, this.artistName, this.cover, this.trackTitle})
      : super(key: key);

  final String trackTitle;
  final String artistName;
  final Widget cover;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: cover,
      title: Text(trackTitle),
      subtitle: Text(artistName),
    );
  }
}

class HiddenJamListTile extends StatelessWidget {
  const HiddenJamListTile({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.asset("assets/icon/tastebooster_logo_barcode.png"),
      title: Text(
        "Hidden jam",
        style: TextStyle(
            fontFamily: GoogleFonts.libreBarcode39Text().fontFamily,
            fontSize: 30),
      ),
    );
  }
}
