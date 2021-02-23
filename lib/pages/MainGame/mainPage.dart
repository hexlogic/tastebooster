import 'dart:math';

import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tindercard/flutter_tindercard.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:tastebooster/main.dart';
import 'package:tastebooster/pages/Settings/appConfig.dart';
import 'package:tastebooster/data/spotify/Library.dart';
import 'package:tastebooster/data/spotify/models/TrackObject.dart';
import 'package:tastebooster/data/tastebooster/Tastebooster.dart';
import 'package:tastebooster/pages/LikedTracks/likedTracksPage.dart';
import 'package:tastebooster/pages/Settings/settingsPage.dart';
import 'package:tastebooster/providers/AuthCredentialsProvider.dart';
import 'package:provider/provider.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:tastebooster/providers/DatabaseProvider.dart';
import 'package:tastebooster/providers/GameContentProvider.dart';
import 'package:tastebooster/providers/PlayerProvider.dart';

CardController controller;
DatabaseHelper helper = DatabaseHelper.instance;

// TODO: play/pause current track

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
          appBar: AppBar(
            leading: IconButton(
              icon: Icon(Icons.settings),
              onPressed: () => Navigator.of(context).push(
                PagesConfig.createRoute(SettingsPage()),
              ),
            ),
            actions: [
              IconButton(
                icon: Icon(Icons.favorite_border),
                onPressed: () {
                  Navigator.of(context).push(
                    PagesConfig.createRoute(
                      LikedTracksPage(),
                    ),
                  );
                },
              )
            ],
            title: AppBarTitle(
              title: "Tastebooster",
            ),
          ),
          body: FutureBuilder(
            builder: (context, snapshot) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CardsWidget(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        buildCardControls(
                          icon: Icons.close,
                          color: Colors.red[400],
                          onPressed: () {
                            controller.triggerLeft();
                          },
                        ),
                        buildCardControls(
                          icon: Icons.favorite,
                          color: Colors.green,
                          onPressed: () => controller.triggerRight(),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
          )),
    );
  }

  Container buildCardControls({
    IconData icon,
    Color color,
    VoidCallback onPressed,
  }) {
    return Container(
      width: 100,
      height: 70,
      child: RaisedButton(
        color: color,
        elevation: 0,
        onPressed: onPressed,
        child: Icon(
          icon,
          size: 40,
          color: Colors.white,
        ),
        shape: CircleBorder(),
      ),
    );
  }
}

class CardsWidget extends StatefulWidget {
  @override
  _CardsWidgetState createState() => _CardsWidgetState();
}

class _CardsWidgetState extends State<CardsWidget> with WidgetsBindingObserver {
  Future<List<SimplifiedTrackObject>> tracks;

  AppLifecycleState _notification;

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    setState(() {
      _notification = state;
    });
  }

  @override
  void initState() {
    awaitForGamePlaylist();
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  Future<void> awaitForGamePlaylist() async {
    tracks = Tastebooster.getGameTrackIDs(
        accessToken: context.read<AuthCredentialsProvider>().authToken,
        helper: helper,
        userID: context.read<AuthCredentialsProvider>().userID);

    context.read<GameContentProvider>().setGameTracks(await tracks);

    List<Audio> urls = [];
    for (var track in context.read<GameContentProvider>().gameTracks) {
      urls.add(Audio.network(track.previewURL));
    }

    for (;;) {
      if (_notification == AppLifecycleState.detached ||
          _notification == AppLifecycleState.inactive ||
          _notification == AppLifecycleState.paused) {
        await Future.delayed(Duration(milliseconds: 500));
      } else {
        context.read<PlayerProvider>().openPlaylist(urls);
        break;
      }
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  void onLike({UserTrack track, String trackID}) {
    helper.insertLikedTrack(track);
    Library.saveTracksForUser(
        accessToken: context.read<AuthCredentialsProvider>().authToken,
        trackIDs: [trackID]);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.5,
      child: FutureBuilder<List<SimplifiedTrackObject>>(
        future: tracks,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return TinderSwapCard(
              orientation: AmassOrientation.BOTTOM,
              swipeDown: true,
              allowVerticalMovement: true,
              stackNum: 3,
              swipeEdge: 5.0,
              maxWidth: MediaQuery.of(context).size.width * 0.9,
              maxHeight: MediaQuery.of(context).size.height * 0.4,
              minWidth: MediaQuery.of(context).size.width * 0.8,
              minHeight: MediaQuery.of(context).size.height * 0.3,
              totalNum: context.watch<GameContentProvider>().gameTracks.length,
              cardBuilder: (context, index) {
                return Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  color: Colors.grey[900],
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text("Track #${index + 1}"),
                      // IconButton(
                      //   icon: Icon(Icons.replay_rounded),
                      //   onPressed: () {},
                      //   iconSize: 40,
                      // ),

                      Container(
                        width: MediaQuery.of(context).size.width * 0.5,
                        child: StreamBuilder(
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              var trackDuration;
                              try {
                                trackDuration = context
                                    .watch<PlayerProvider>()
                                    .getTrackDuration();
                              } on NoSuchMethodError {
                                trackDuration = Duration(seconds: 30)
                                    .inMilliseconds
                                    .toDouble();
                              }
                              return LinearProgressIndicator(
                                valueColor:
                                    AlwaysStoppedAnimation(Colors.white),
                                minHeight: 2,
                                value: snapshot.data.inMilliseconds.toDouble() /
                                    trackDuration,
                              );
                            } else {
                              return CircularProgressIndicator(
                                valueColor:
                                    AlwaysStoppedAnimation(Colors.white),
                              );
                            }
                          },
                          stream: context
                              .watch<PlayerProvider>()
                              .getPlayerCurrentPosition(),
                        ),
                      ),
                    ],
                  ),
                );
              },
              cardController: controller = CardController(),
              swipeCompleteCallback: (orientation, index) {
                if (orientation != CardSwipeOrientation.RECOVER) {
                  askForInstagramFollow(index: index);
                  String trackID = snapshot.data[index].id;
                  String userID =
                      context.read<AuthCredentialsProvider>().userID;
                  UserTrack track = UserTrack();
                  track.trackId = trackID;
                  track.userId = userID;
                  if (orientation == CardSwipeOrientation.RIGHT) {
                    // When user swipes right (like)
                    showToastNotification(
                        "Liked Track #${index + 1}", Colors.green[600]);
                    onLike(track: track, trackID: trackID);
                  } else if (orientation == CardSwipeOrientation.LEFT) {
                    // When user swipes left (dislike)
                    showToastNotification(
                        "Disliked Track #${index + 1}", Colors.red[400]);
                    helper.insertBlockedTrack(track);
                  } else if (orientation == CardSwipeOrientation.DOWN) {
                    showToastNotification(
                        "Skipped Track #${index + 1}", Colors.grey[700]);
                  }
                  // showing notification that user liked a track

                }
              },
              swipeUpdateCallback:
                  (DragUpdateDetails details, Alignment align) {
                /// Get swiping card's alignment
                if (align.x < 0) {
                  //Card is LEFT swiping
                } else if (align.x > 0) {
                  //Card is RIGHT swiping
                }
              },
            );
          } else {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Loading our music gun",
                  style: TextStyle(fontSize: 18),
                ),
                SizedBox(
                  height: 20,
                ),
                CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation(Colors.white),
                )
              ],
            );
          }
        },
      ),
    );
  }

  void showToastNotification(String text, Color toastColor) {
    showSimpleNotification(Text(text),
        background: toastColor,
        autoDismiss: true,
        duration: Duration(seconds: 1),
        position: NotificationPosition.bottom);
    context.read<PlayerProvider>().playNextTrack();
  }

  void askForInstagramFollow({int index}) async {
    bool isFollowed = await MyApp.sharedPrefsReadIsInstaFollowed() ?? false;
    if (!isFollowed) {
      _showFollowDialog(index);
    }
  }

  void _showFollowDialog(int index) {
    if (index % 5 == Random().nextInt(5)) {
      showDialog(
          context: context,
          barrierDismissible: true,
          child: AlertDialog(
            title: Text("Follow us on Instagram"),
            actions: [
              TextButton(
                  child: Text('Later'),
                  onPressed: () => Navigator.of(context).pop()),
              TextButton(
                  child: Text('Follow'),
                  onPressed: () {
                    SettingsPage.followOnInstagram();
                    Navigator.of(context).pop();
                  }),
            ],
            content: SingleChildScrollView(
                child: ListBody(
              children: [
                Text(
                    'Our app is completely free from ads and any charges so we encourage you to follow us on Instagram.\n'),
                Text(
                    "As soon as you follow, we won\'t ever bother you again. :)")
              ],
            )),
          ));
    }
  }
}
