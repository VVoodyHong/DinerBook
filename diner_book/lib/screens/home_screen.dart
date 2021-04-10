import 'package:flutter/material.dart';

import 'package:diner_book/app_theme.dart';
import 'package:diner_book/component/bottom_bar.dart';
import 'package:diner_book/screens/my_diner_book/my_diner_book.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  AnimationController animationController;

  Widget tabBody = Container(
    color: AppTheme.background,
  );

  @override
  void initState() {
    animationController = AnimationController(
        duration: const Duration(milliseconds: 600), vsync: this);
    tabBody = MyDinerBook(animationController: animationController);
    super.initState();
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
                return const SizedBox();
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
    await Future<dynamic>.delayed(const Duration(milliseconds: 200));
    return true;
  }

  Widget bottomBar() {
    return Column(
      children: <Widget>[
        Expanded(
          child: SizedBox()
        ),
        BottomBar()
      ]
    );
  }
}