import 'package:diner_book/models/diner_info.dart';
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
    Map<String, DinerInfo> arguments = ModalRoute.of(context).settings.arguments;
    DinerInfo dinerInfo = arguments['dinerInfo'];

    return Container(
      color:AppTheme.background,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: HeaderBar(
            title: '다이너 상세',
            backBtn: true
          ),
          body: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.all(10),
            child: Container(
              padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
              decoration: BoxDecoration(
                border: Border.all(color: AppTheme.grey),
                borderRadius: BorderRadius.circular(10),
                color: Colors.white
              ),
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    dinerInfo.thumbnailPath != '' ?
                    Container(
                      height: MediaQuery.of(context).size.width,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                          image: AssetImage(
                            dinerInfo.thumbnailPath
                          ),
                          fit: BoxFit.cover
                        )
                      )
                    ) :
                    Container(),
                    Row(
                      children: <Widget>[
                        Flexible(
                          child: Container(
                            padding: EdgeInsets.fromLTRB(10, 13, 0, 0),
                            child: Text(
                              dinerInfo.foodName,
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                              overflow: TextOverflow.clip,
                            )
                          )
                        ),
                        Container(
                          padding: EdgeInsets.fromLTRB(5, 15, 0, 0),
                          child: Icon(
                            Icons.star,
                            color: AppTheme.signatureColor,
                            size: 20,
                          )
                        ),
                        Container(
                          padding: EdgeInsets.fromLTRB(3, 15, 10, 0),
                          child: Text(
                            dinerInfo.starRating.toString(),
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        )
                      ]
                    ),
                    Row(
                      children: <Widget>[
                        Flexible(
                          child: Container(
                            padding: EdgeInsets.fromLTRB(10, 10, 0, 0),
                            child: Text(
                              '상호명: ' + dinerInfo.dinerName,
                              style: TextStyle(
                                color: AppTheme.grey
                              ),
                              overflow: TextOverflow.clip,
                            )
                          )
                        ),
                        Container(
                          padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                          child: Text(
                            '분류: ' + dinerInfo.category,
                            style: TextStyle(
                              color: AppTheme.grey
                            )
                          )
                        ),
                      ]
                    ),
                    Row(
                      children: <Widget>[
                        Flexible(
                        child: Container(
                            padding: EdgeInsets.fromLTRB(10, 10, 0, 0),
                            child: Text(
                              '주소: ' + dinerInfo.address,
                              style: TextStyle(
                                color: AppTheme.grey
                              ),
                              overflow: TextOverflow.clip,
                            )
                          )
                        ),
                        Container(
                          padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                          child: Text(
                            '거리: ' + dinerInfo.distance.toString() + 'km',
                            style: TextStyle(
                              color: AppTheme.grey
                            )
                          )
                        ),
                      ]
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
                      child: Text(
                        dinerInfo.comment,
                        style: TextStyle(
                          fontSize: 17
                        )
                      )
                    )
                  ],
                )
              )
            )
          )
        )
      )
    );
  }
}