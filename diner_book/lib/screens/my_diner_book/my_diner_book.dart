import 'package:flutter/material.dart';

class MyDinerBook extends StatefulWidget {
  const MyDinerBook({this.animationController});

  final AnimationController animationController;
  @override
  _MyDinerBookState createState() => _MyDinerBookState();
}

class _MyDinerBookState extends State<MyDinerBook> with TickerProviderStateMixin {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: <Widget>[
          Text('다이너북')
        ]
      )
    );
  }
}