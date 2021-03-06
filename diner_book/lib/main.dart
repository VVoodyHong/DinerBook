import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:splashscreen/splashscreen.dart';

import 'package:diner_book/app_theme.dart';
import 'package:diner_book/screens/home_screen.dart';

import 'common/routes.dart';

void main() {
  runApp(
    DinerBook()
  );
}

class DinerBook extends StatelessWidget {
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
        title: Text(
          'DinerBook',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 40.0,
            color: AppTheme.signatureColor
          ),
        ),
        backgroundColor: AppTheme.background,
        loaderColor: AppTheme.signatureColor
        // loadingText: Text(''),
        // styleTextUnderTheLoader: TextStyle(),
        // image: Image.network('https://i.imgur.com/TyCSG9A.png'),
        // photoSize: 100.0,
      ),
      onGenerateRoute: RouteConfiguration.onGenerateRoute
    );
  }
}