import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PagesConfig {
  static ThemeData buildThemeData() => ThemeData(
        primaryColor: Colors.grey[900],
        brightness: Brightness.dark,
        fontFamily: GoogleFonts.montserrat().fontFamily,
        appBarTheme: AppBarTheme(
          centerTitle: true,
        ),
      );

  static Image getTasteboosterImage() {
    return Image.asset("assets/icon/tastebooster_logo_barcode.png");
  }

  static Route createRoute(Widget widget) {
    /// Have to think about need of this transition

    // return PageRouteBuilder(
    //   pageBuilder: (context, animation, secondaryAnimation) => widget,
    //   transitionsBuilder: (context, animation, secondaryAnimation, child) {
    //     var curve = Curves.fastOutSlowIn;

    //     return FadeTransition(
    //       opacity: animation.drive(CurveTween(curve: curve)),
    //       child: child,
    //     );
    //   },
    // );
    return MaterialPageRoute(builder: (context) => widget);
  }
}

class AppBarTitle extends StatelessWidget {
  const AppBarTitle({Key key, this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: buildLogoTextStyle(),
    );
  }

  static TextStyle buildLogoTextStyle({double fontSize = 30}) {
    return TextStyle(
      fontFamily: GoogleFonts.libreBarcode39Text().fontFamily,
      fontSize: fontSize,
    );
  }
}
