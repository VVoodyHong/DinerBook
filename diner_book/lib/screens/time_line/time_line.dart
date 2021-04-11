import 'package:flutter/material.dart';
import 'package:diner_book/component/header_bar.dart';

class TimeLine extends StatefulWidget {
  TimeLine({this.animationController});

  final AnimationController animationController;
  @override
  _TimeLineState createState() => _TimeLineState();
}

class _TimeLineState extends State<TimeLine> with TickerProviderStateMixin {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: HeaderBar(
        title: '타임라인'
      ),
      body: Stack(
        children: <Widget>[
          Center(child:Text('타임라인 페이지'))
        ]
      )
    );
  }
}