import 'package:flutter/material.dart';
import 'package:diner_book/component/header_bar.dart';

class Chatting extends StatefulWidget {
  Chatting({this.animationController});

  final AnimationController animationController;
  @override
  _ChattingState createState() => _ChattingState();
}

class _ChattingState extends State<Chatting> with TickerProviderStateMixin {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: HeaderBar(
        title: '채팅'
      ),
      body: Stack(
        children: <Widget>[
          Center(child:Text('채팅 페이지'))
        ]
      )
    );
  }
}