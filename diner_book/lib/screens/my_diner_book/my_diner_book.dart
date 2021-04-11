import 'package:flutter/material.dart';
import 'package:diner_book/component/header_bar.dart';

class MyDinerBook extends StatefulWidget {
  MyDinerBook({this.animationController});

  final AnimationController animationController;
  @override
  _MyDinerBookState createState() => _MyDinerBookState();
}

class _MyDinerBookState extends State<MyDinerBook> with TickerProviderStateMixin {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: HeaderBar(
        title: '다이너북'
      ),
      body: Stack(
        children: <Widget>[
          Center(child:Text('다이너북 페이지'))
        ]
      )
    );
  }
}