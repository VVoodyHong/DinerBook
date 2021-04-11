import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:diner_book/app_theme.dart';

class BottomBar extends StatefulWidget {
  BottomBar({this.changeIndex, this.isSelectedIdx});

  final int isSelectedIdx;
  final Function(int index) changeIndex;
  @override
  _BottomBarState createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> with TickerProviderStateMixin {
  AnimationController animationController;

  @override
  void initState() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );
    animationController.forward();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.bottomCenter,
      children: <Widget>[
        AnimatedBuilder(
          animation: animationController,
          builder: (BuildContext context, Widget child) {
            return Transform(
              transform: Matrix4.translationValues(0.0, 0.0, 0.0),
              child: PhysicalShape(
                color: AppTheme.white,
                elevation: 16.0,
                clipper: TabClipper(
                  radius: Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
                    parent: animationController,
                    curve: Curves.fastOutSlowIn
                  )).value * 38.0
                ),
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 62,
                      child: Padding(
                        padding: EdgeInsets.only(left: 8, right: 8, top: 4),
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              child: InkWell(
                                onTap: () =>{widget.changeIndex(0)},
                                child: Container(
                                  height: MediaQuery.of(context).size.height,
                                  alignment: Alignment.center,
                                  child: Text(
                                    '다이너북',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: widget.isSelectedIdx == 0 ? AppTheme.signatureColor : null
                                    ),
                                  )
                                )
                              )
                            ),
                            Expanded(
                              child: InkWell(
                                onTap: () =>{widget.changeIndex(1)},
                                child: Container(
                                  height: MediaQuery.of(context).size.height,
                                  alignment: Alignment.center,
                                  child: Text(
                                    '타임라인',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: widget.isSelectedIdx == 1 ? AppTheme.signatureColor : null
                                    ),
                                  )
                                )
                              )
                            ),
                            SizedBox(
                              width: Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
                                parent: animationController,
                                curve: Curves.fastOutSlowIn
                              )).value * 64.0
                            ),
                            Expanded(
                              child: InkWell(
                                onTap: () =>{widget.changeIndex(2)},
                                child: Container(
                                  height: MediaQuery.of(context).size.height,
                                  alignment: Alignment.center,
                                  child: Text(
                                    '채팅',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: widget.isSelectedIdx == 2 ? AppTheme.signatureColor : null
                                    ),
                                  )
                                )
                              )
                            ),
                            Expanded(
                              child: InkWell(
                                onTap: () =>{widget.changeIndex(3)},
                                child: Container(
                                  height: MediaQuery.of(context).size.height,
                                  alignment: Alignment.center,
                                  child: Text(
                                    '더보기',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: widget.isSelectedIdx == 3 ? AppTheme.signatureColor : null
                                    ),
                                  )
                                )
                              )
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).padding.bottom,
                    )
                  ],
                ),
              ),
            );
          }
        ),
        Padding(
          padding: EdgeInsets.only(bottom: MediaQuery.of(context).padding.bottom),
          child: SizedBox(
            width: 38 * 2.0,
            height: 38 + 62.0,
            child: Container(
              alignment: Alignment.topCenter,
              color: Colors.transparent,
              child: SizedBox(
                width: 38 * 2.0,
                height: 38 * 2.0,
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: ScaleTransition(
                    alignment: Alignment.center,
                    scale: Tween<double>(begin: 0.0, end: 1.0).animate(
                      CurvedAnimation(
                        parent: animationController,
                        curve: Curves.fastOutSlowIn
                      )
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        color: AppTheme.nearlyDarkBlue,
                        gradient: LinearGradient(
                          colors: [
                            AppTheme.nearlyDarkBlue,
                            AppTheme.signatureColor,
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight
                        ),
                        shape: BoxShape.circle,
                        boxShadow: <BoxShadow>[
                          BoxShadow(
                            color: AppTheme.nearlyDarkBlue
                                .withOpacity(0.5),
                            offset: const Offset(0, 8.0),
                            blurRadius: 16.0
                          ),
                        ],
                      ),
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          splashColor: Colors.white.withOpacity(0.1),
                          highlightColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          onTap: () {},
                          child: Icon(
                            Icons.add,
                            color: AppTheme.white,
                            size: 32,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class TabClipper extends CustomClipper<Path> {
  TabClipper({this.radius = 38.0});

  final double radius;

  @override
  Path getClip(Size size) {
    final Path path = Path();

    final double v = radius * 2;
    path.lineTo(0, 0);
    path.arcTo(Rect.fromLTWH(0, 0, radius, radius), degreeToRadians(180), degreeToRadians(90), false);
    path.arcTo(
      Rect.fromLTWH(((size.width / 2) - v / 2) - radius + v * 0.04, 0, radius, radius),
      degreeToRadians(270),
      degreeToRadians(70),
      false
    );

    path.arcTo(Rect.fromLTWH((size.width / 2) - v / 2, -v / 2, v, v), degreeToRadians(160), degreeToRadians(-140), false);

    path.arcTo(
      Rect.fromLTWH((size.width - ((size.width / 2) - v / 2)) - v * 0.04, 0, radius, radius),
      degreeToRadians(200),
      degreeToRadians(70),
      false
    );
    path.arcTo(
      Rect.fromLTWH(size.width - radius, 0, radius, radius),
      degreeToRadians(270),
      degreeToRadians(90),
      false
    );
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(TabClipper oldClipper) => true;

  double degreeToRadians(double degree) {
    final double redian = (math.pi / 180) * degree;
    return redian;
  }
}