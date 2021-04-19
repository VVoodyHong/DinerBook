import 'package:flutter/material.dart';

import 'package:diner_book/app_theme.dart';
import 'package:diner_book/widget/header_bar.dart';

class MyDinerBookDetailScreen extends StatefulWidget {

  @override
  _MyDinerBookDetailScreenState createState() => _MyDinerBookDetailScreenState();
}

class _MyDinerBookDetailScreenState extends State<MyDinerBookDetailScreen> with TickerProviderStateMixin {

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> arguments = ModalRoute.of(context).settings.arguments;
    return Container(
      color:AppTheme.background,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: HeaderBar(
            title: '다이너 상세'
          ),
          body: Stack(
            children: <Widget>[
              Center(
                child:Text(
                  arguments['dinerName'] + ' ' + arguments['foodName']
                )
              )
            ]
          )
        )
      )
    );
  }
}