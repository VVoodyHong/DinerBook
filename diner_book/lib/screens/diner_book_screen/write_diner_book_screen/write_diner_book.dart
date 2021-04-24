import 'package:flutter/material.dart';

import 'package:diner_book/app_theme.dart';
import 'package:diner_book/widget/header_bar.dart';

class WriteDinerBookScreen extends StatefulWidget {

  @override
  _WriteDinerBookScreenState createState() => _WriteDinerBookScreenState();
}

class _WriteDinerBookScreenState extends State<WriteDinerBookScreen> {

  @override
  Widget build(BuildContext context) {

    return Container(
      color:AppTheme.background,
      child: SafeArea(
        child: Scaffold(
          appBar: HeaderBar(
            title: '다이너북 추가',
            backBtn: true
          ),
          body: Center(child: Text('다이너북 추가'))
        )
      )
    );
  }
}