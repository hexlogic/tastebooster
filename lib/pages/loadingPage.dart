import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:tastebooster/main.dart';
import 'package:tastebooster/pages/Login/loginPage.dart';

class LoadingPage extends StatefulWidget {
  @override
  _LoadingPageState createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: FutureBuilder<bool>(
            future: MyApp.sharedPrefsReadIsLoggedIn(),
            builder: (context, snapshot) {
              Widget widget;
              if (snapshot.hasData) {
                if (snapshot.data == true) {
                  LoginPage.loginSpotify(context: context);
                } else {
                  SchedulerBinding.instance.addPostFrameCallback((_) {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => LoginPage()));
                  });
                }
              }
              widget = Column(
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

              return widget;
            },
          ),
        ),
      ),
    );
  }
}
