import 'package:flutter/material.dart';
import 'package:spotify_sdk/spotify_sdk.dart';
import 'package:tastebooster/data/spotify/UsersProfile.dart';
import 'package:tastebooster/pages/Settings/appConfig.dart';
import 'package:tastebooster/main.dart';
import 'package:provider/provider.dart';
import 'package:tastebooster/pages/MainGame/mainPage.dart';
import 'package:tastebooster/providers/AuthCredentialsProvider.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key key}) : super(key: key);

  static Future loginSpotify({
    BuildContext context,
  }) async {
    var authToken = await SpotifySdk.getAuthenticationToken(
      // TODO: Paste your Spotify API code here
        clientId: "API-KEY-HERE",
        redirectUrl: "tsbt://callback",
        scope:
            "user-top-read,user-library-modify,user-library-read,user-read-private,user-read-email");

    context.read<AuthCredentialsProvider>().setAuthToken(token: authToken);
    context.read<AuthCredentialsProvider>().setUserID(
        id: await UsersProfile.getCurrentUsersProfile(accessToken: authToken)
            .then((value) => value.id));

    MyApp.sharedPrefsSaveIsLoggedIn(value: true);

    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => MainPage()));
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: SafeArea(
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child: Text(
                    "Tastebooster",
                    style: AppBarTitle.buildLogoTextStyle(fontSize: 50),
                  ),
                ),
                LoginButton()
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class LoginButton extends StatelessWidget {
  const LoginButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      decoration: ShapeDecoration(
        shape: CircleBorder(),
      ),
      child: MaterialButton(
        color: Colors.grey[700],
        elevation: 0,
        focusElevation: 0,
        disabledElevation: 0,
        highlightElevation: 0,
        hoverElevation: 0,
        onPressed: () async => LoginPage.loginSpotify(context: context),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              height: 20,
              child: Image.asset(
                'assets/Spotify_Icon_RGB_Green.png',
              ),
            ),
            Text(
              "Login with Spotify",
              style: TextStyle(color: Colors.white),
            )
          ],
        ),
      ),
    );
  }
}
