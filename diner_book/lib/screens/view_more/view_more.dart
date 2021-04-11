import 'package:flutter/material.dart';
import 'package:diner_book/component/header_bar.dart';

class ViewMore extends StatefulWidget {
  ViewMore({this.animationController});

  final AnimationController animationController;
  @override
  _ViewMoreState createState() => _ViewMoreState();
}

class _ViewMoreState extends State<ViewMore> with TickerProviderStateMixin {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: HeaderBar(
        title: '더보기'
      ),
      body: Stack(
        children: <Widget>[
          Center(child:Text('더보기 페이지'))
        ]
      )
    );
  }
}