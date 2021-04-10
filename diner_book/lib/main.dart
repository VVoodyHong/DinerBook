import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:diner_book/app_theme.dart';
import 'package:diner_book/screens/home_screen.dart';

void main() {
  runApp(DinerBook());
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
      home: HomeScreen()
    );
  }
}