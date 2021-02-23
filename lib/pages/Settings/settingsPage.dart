import 'package:flutter/material.dart';
import 'package:tastebooster/main.dart';
import 'package:tastebooster/pages/Settings/accountPage.dart';
import 'package:tastebooster/pages/Settings/appConfig.dart';
import 'package:package_info/package_info.dart';
import 'package:url_launcher/url_launcher.dart';

class SettingsPage extends StatelessWidget {
  static followOnInstagram() async {
    const url = "https://instagram.com/tastebooster_";
    if (await canLaunch(url)) {
      MyApp.sharedPrefsSaveIsInstaFollowed(value: true);
      await launch(url);
    } else {
      throw "Could not launch $url";
    }
  }

  _becomePatron() async {
    const url = "https://www.patreon.com/tastebooster";
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw "Could not launch $url";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AppBarTitle(
          title: "Settings",
        ),
      ),
      body: Column(
        children: [
          Flexible(
            child: ListView(
              children: [
                ListTile(
                  leading: Icon(Icons.account_circle),
                  title: Text("Account"),
                  onTap: () => Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => AccountPage(),
                  )),
                ),
                ListTile(
                  leading: Icon(Icons.notifications),
                  title: Text("Manage Notifications"),
                  enabled: false,
                ),
                ListTile(
                  leading: Icon(Icons.info),
                  title: Text("About"),
                  onTap: () async => showAboutDialog(
                    context: context,
                    applicationIcon: Container(
                      width: 60,
                      height: 60,
                      child: Image.asset(
                          'assets/icon/tastebooster_logo_barcode.png'),
                    ),
                    applicationName: "Tastebooster",
                    applicationVersion:
                        "version: ${await PackageInfo.fromPlatform().then((value) => value.version)}",
                  ),
                )
              ],
            ),
          ),
          Text("Support us on:"),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                width: 100,
                height: 100,
                child: FlatButton(
                    onPressed: () => followOnInstagram(),
                    child: Image.asset('assets/instagram.png')),
              ),
              Container(
                width: 100,
                height: 100,
                child: FlatButton(
                    onPressed: () => _becomePatron(),
                    child: Image.asset('assets/patreon.png')),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
