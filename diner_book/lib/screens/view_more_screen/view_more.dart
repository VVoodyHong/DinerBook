import 'package:flutter/material.dart';

import 'package:diner_book/app_theme.dart';
import 'package:diner_book/widget/header_bar.dart';

class ViewMoreScreen extends StatefulWidget {
  ViewMoreScreen({this.animationController});

  final AnimationController animationController;
  @override
  _ViewMoreScreenState createState() => _ViewMoreScreenState();
}

class _ViewMoreScreenState extends State<ViewMoreScreen> with TickerProviderStateMixin {

  @override
  Widget build(BuildContext context) {
    return Container(
      color:AppTheme.background,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: HeaderBar(
            title: '더보기'
          ),
          body: Stack(
            children: <Widget>[
              Center(child:Text('더보기 페이지'))
            ]
          )
        )
      )
    );
  }
}