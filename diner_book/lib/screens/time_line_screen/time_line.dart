import 'package:flutter/material.dart';

import 'package:diner_book/app_theme.dart';
import 'package:diner_book/widget/header_bar.dart';

class TimeLineScreen extends StatefulWidget {
  TimeLineScreen({this.animationController});

  final AnimationController animationController;
  @override
  _TimeLineScreenState createState() => _TimeLineScreenState();
}

class _TimeLineScreenState extends State<TimeLineScreen> with TickerProviderStateMixin {

  @override
  Widget build(BuildContext context) {
    return Container(
      color:AppTheme.background,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: HeaderBar(
            title: '타임라인'
          ),
          body: Stack(
            children: <Widget>[
              Center(child:Text('타임라인 페이지'))
            ]
          )
        )
      )
    );
  }
}