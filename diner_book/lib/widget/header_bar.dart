import 'package:flutter/material.dart';

import 'package:diner_book/app_theme.dart';

class HeaderBar extends StatefulWidget with PreferredSizeWidget {
  HeaderBar({
    this.title,
    this.filter,
    this.isDinerBook = false,
    this.onPressRightBtn
  });

  final String title;
  final String filter;
  final bool isDinerBook;
  final Function onPressRightBtn;

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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  children: <Widget> [
                    !widget.isDinerBook ?
                    IconButton(
                      padding: EdgeInsets.only(right: 10),
                      constraints: BoxConstraints(),
                      icon: Icon(Icons.arrow_back),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ) : Container(),
                    Text(
                      widget.title,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold
                      )
                    )
                  ],
                ),
                widget.isDinerBook ? Row(
                  children: <Widget>[
                    InkWell(
                      onTap: () {widget.onPressRightBtn();},
                      child: Container(
                        height: 40,
                        child: Row(
                          children: <Widget>[
                            Text(
                              widget.filter,
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold
                              )
                            ),
                            Container(
                              padding: EdgeInsets.zero,
                              constraints: BoxConstraints(),
                              child: Icon(
                                Icons.keyboard_arrow_down,
                                size: 25
                              ),
                            )
                          ]
                        )
                      )
                    )
                  ]
                ) : Container()
              ]
            )
          ]
        )
      )
    );
  }  
  
}