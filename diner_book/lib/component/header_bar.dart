import 'package:flutter/material.dart';

import 'package:diner_book/app_theme.dart';

class HeaderBar extends StatefulWidget with PreferredSizeWidget {
  HeaderBar({this.title});

  final String title;

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  _HeaderBarState createState() => _HeaderBarState();
}

class _HeaderBarState extends State<HeaderBar>  {
  
  @override
  Widget build(BuildContext context){
    return AppBar(
      elevation: 3,
      automaticallyImplyLeading: false,
      backgroundColor: AppTheme.white,
      flexibleSpace: Container(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Text(
                  widget.title,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold
                  )
                )
              ]
            )
          ],
        )
      )
    );
  }  
  
}