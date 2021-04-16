import 'package:flutter/material.dart';

import 'package:diner_book/app_theme.dart';
import 'package:diner_book/widget/header_bar.dart';

class ChattingScreen extends StatefulWidget {
  ChattingScreen({this.animationController});

  final AnimationController animationController;
  @override
  _ChattingScreenState createState() => _ChattingScreenState();
}

class _ChattingScreenState extends State<ChattingScreen> with TickerProviderStateMixin {

  @override
  Widget build(BuildContext context) {
    return Container(
      color:AppTheme.background,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: HeaderBar(
            title: '채팅'
          ),
          body: Stack(
            children: <Widget>[
              Center(child:Text('채팅 페이지'))
            ]
          )
        )
      )
    );
  }
}