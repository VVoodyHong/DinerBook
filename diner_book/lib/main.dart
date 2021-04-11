import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:splashscreen/splashscreen.dart';

import 'package:diner_book/app_theme.dart';
import 'package:diner_book/screens/home_screen.dart';

void main() {
  runApp(
    DinerBook()
  );
}

class DinerBook extends StatefulWidget {
  @override
  _DinerBookState createState() => _DinerBookState();
}

class _DinerBookState extends State<DinerBook> {

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return MaterialApp(
      title: 'DinerBook',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: AppTheme.textTheme,
      ),
      home: SplashScreen(
        seconds: 2,
        navigateAfterSeconds: HomeScreen(),
        title: Text('DinerBook',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 40.0,
            color: HexColor('#6A88E5')
          ),
        ),
        backgroundColor: Colors.transparent,
        loaderColor: HexColor('#6A88E5')
        // loadingText: Text(''),
        // styleTextUnderTheLoader: TextStyle(),
        // image: Image.network('https://i.imgur.com/TyCSG9A.png'),
        // photoSize: 100.0,
      )
    );
  }
}

class HexColor extends Color {
  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));

  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll('#', '');
    if (hexColor.length == 6) {
      hexColor = 'FF' + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }
}