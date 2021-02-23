import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:tastebooster/data/spotify/UsersProfile.dart';
import 'package:tastebooster/data/spotify/models/UserObject.dart';
import 'package:tastebooster/main.dart';
import 'package:tastebooster/pages/Login/loginPage.dart';
import 'package:tastebooster/pages/Settings/appConfig.dart';
import 'package:provider/provider.dart';
import 'package:tastebooster/providers/AuthCredentialsProvider.dart';
import 'package:tastebooster/providers/PlayerProvider.dart';

class AccountPage extends StatelessWidget {
  Future<void> _showWarningDialog(BuildContext context) async {
    return showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) {
        return AlertDialog(
          actions: [
            TextButton(
              child: Text("Confirm"),
              onPressed: () {
                MyApp.sharedPrefsSaveIsLoggedIn(value: false);
                MyApp.sharedPrefsSaveIsInstaFollowed(value: false);
                context.read<PlayerProvider>().stopPlayer();
                SchedulerBinding.instance.addPostFrameCallback((_) {
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(builder: (context) => LoginPage()),
                      (Route<dynamic> route) => false);
                });
              },
            ),
            TextButton(
              child: Text("Cancel"),
              onPressed: () => Navigator.of(context).pop(),
            )
          ],
          title: Text("You\'re about to leave the app"),
          content: (SingleChildScrollView(
            child: ListBody(
              children: [Text("Logout?")],
            ),
          )),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Account",
          style: AppBarTitle.buildLogoTextStyle(),
        ),
      ),
      body: FutureBuilder<PrivateUserObject>(
        future: UsersProfile.getCurrentUsersProfile(
            accessToken: context.watch<AuthCredentialsProvider>().authToken),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Column(
              children: [
                Flexible(
                  child: ListView(
                    children: [
                      // Padding(
                      //   padding: const EdgeInsets.all(16.0),
                      //   child: ClipOval(

                      //     child: snapshot.data.images != null
                      //         ? Image.network(
                      //             snapshot.data.images[0].url,
                      //             width: 70,
                      //             height: 70,
                      //             fit: BoxFit.cover,
                      //           )
                      //         : PagesConfig.getTasteboosterImage(),
                      //   ),
                      // ),
                      ListTile(
                        leading: Text('Name'),
                        trailing: Text(
                          snapshot.data.displayName,
                        ),
                      ),
                      ListTile(
                        leading: Text('Email'),
                        trailing: Text(snapshot.data.email),
                      ),
                      ListTile(
                        leading: Text('Country'),
                        trailing: Text(snapshot.data.country),
                      ),
                    ],
                  ),
                ),
                MaterialButton(
                  onPressed: () => _showWarningDialog(context),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [Icon(Icons.logout), Text("Logout")],
                  ),
                )
              ],
            );
          } else {
            return Column(
              children: [LinearProgressIndicator()],
            );
          }
        },
      ),
    );
  }
}
