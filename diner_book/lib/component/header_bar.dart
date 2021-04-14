import 'package:flutter/material.dart';

import 'package:diner_book/app_theme.dart';

class HeaderBar extends StatefulWidget with PreferredSizeWidget {
  HeaderBar({
    this.title,
    this.isDinerBook = false
  });

  final String title;
  final bool isDinerBook;

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
                Text(
                  widget.title,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold
                  )
                ),
                widget.isDinerBook ? Row(
                  children: <Widget>[
                    InkWell(
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text("카테고리 선택"),
                              actions: <Widget>[ 
                                OutlinedButton(
                                  style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all<Color>(AppTheme.signatureColor),
                                  ),
                                  child: Text(
                                    "확인",
                                    style: TextStyle(
                                      color: AppTheme.white
                                    )
                                    ),
                                  onPressed: () {
                                    Navigator.pop(context);
                                  }
                                )
                              ]
                            );
                          }
                        );
                      },
                      child: Container(
                        height: 40,
                        child: Row(
                          children: <Widget>[
                            Text(
                              '전체',
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