import 'package:flutter/material.dart';

import 'package:diner_book/app_theme.dart';
import 'package:diner_book/widget/bottom_bar.dart';
import 'package:diner_book/screens/diner_book_screen/diner_book.dart';
import 'package:diner_book/screens/time_line_screen/time_line.dart';
import 'package:diner_book/screens/chatting_screen/chatting.dart';
import 'package:diner_book/screens/view_more_screen/view_more.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  AnimationController animationController;
  int isSelectedIdx;
  Widget tabBody = Container(color: AppTheme.background);
  List<Widget> tabBodyList;

  @override
  void initState() {
    isSelectedIdx = 0;
    animationController = AnimationController(
        duration: Duration(milliseconds: 600), vsync: this);
    tabBody = DinerBookScreen(animationController: animationController);
    tabBodyList = [
      DinerBookScreen(animationController: animationController),
      TimeLineScreen(animationController: animationController),
      ChattingScreen(animationController: animationController),
      ViewMoreScreen(animationController: animationController),
    ];
    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppTheme.background,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: FutureBuilder<bool>(
            future:  getData(),
            builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
              if (!snapshot.hasData) {
                return SizedBox();
              } else {
                return Stack(
                  children: <Widget>[
                    tabBody,
                    bottomBar(),
                  ],
                );
              }
            }
          )
        )
      )
    );
  }

  Future<bool> getData() async {
    // await Future<dynamic>.delayed(Duration(milliseconds: 200));
    return true;
  }

  Widget bottomBar() {

    return Column(
      children: <Widget>[
        Expanded(
          child: SizedBox()
        ),
        BottomBar(
          isSelectedIdx: isSelectedIdx,
          changeIndex: (int index) {
            for ( int idx = 0; idx < tabBodyList.length; idx++) {
              if (index == idx) {
                animationController.reverse().then<dynamic>((data) {
                  if (!mounted) {
                    return;
                  }
                  setState(() {
                    tabBody = tabBodyList[index];
                    isSelectedIdx = index;
                  });
                });
                return;
              }
            }
          }
        )
      ]
    );
  }
}