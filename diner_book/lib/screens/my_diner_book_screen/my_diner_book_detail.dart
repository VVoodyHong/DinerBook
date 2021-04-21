import 'package:flutter/material.dart';

import 'package:diner_book/common/images.dart';
import 'package:diner_book/models/diner_info.dart';
import 'package:diner_book/app_theme.dart';
import 'package:diner_book/widget/header_bar.dart';

class MyDinerBookDetailScreen extends StatefulWidget {

  @override
  _MyDinerBookDetailScreenState createState() => _MyDinerBookDetailScreenState();
}

class _MyDinerBookDetailScreenState extends State<MyDinerBookDetailScreen> with TickerProviderStateMixin {
  bool favorite = false;
  FocusNode focusNode;


  @override
  void initState() {
    super.initState();
    focusNode = FocusNode();
  }

  @override
  void dispose() {
    focusNode.dispose();
    super.dispose();
  }

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
          bottomSheet: Container(
            padding: EdgeInsets.fromLTRB(7, 7, 7, 7),
            child: Material(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
              color: Colors.grey[200],
              child: Padding(
                padding: EdgeInsets.only(left: 12),
                child: TextFormField(
                  focusNode: focusNode,
                  // controller: searchProvider.searchController,
                  keyboardType: TextInputType.text,
                  cursorColor: AppTheme.signatureColor,
                  decoration: InputDecoration(
                    hintText: ' 댓글 입력',
                    isDense: true,
                    contentPadding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                    hintStyle: TextStyle(
                      color: AppTheme.grey,
                      fontWeight: FontWeight.bold
                    ),
                    fillColor:  Colors.white30 ,
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(0),
                      borderSide: BorderSide.none
                    )
                  )
                )
              )
            )
          ),
          body: GestureDetector(
            onTap: () {
              FocusScope.of(context).unfocus();
            },
            child: Container(
              height: MediaQuery.of(context).size.height - 130,
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
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
                        child: Row(
                          children: <Widget>[
                            Container(
                              child: IconButton(
                                padding: EdgeInsets.only(bottom: 8),
                                constraints: BoxConstraints(),
                                icon: Icon(
                                  favorite ? Icons.favorite : Icons.favorite_border,
                                  color: AppTheme.signatureColor,
                                  size: 30,
                                ),
                                onPressed: () {
                                  setState(() {
                                    favorite = !favorite;
                                  });
                                }
                              )
                            ),
                            Container(
                              padding: EdgeInsets.only(left: 10),
                              alignment: Alignment.center,
                              child: Text(
                                favorite ? (dinerInfo.likeCount+1).toString() : dinerInfo.likeCount.toString(),
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              )
                            ),
                            SizedBox(
                              width: 10
                            ),
                            Container(
                              child: IconButton(
                                padding: EdgeInsets.only(bottom: 8),
                                constraints: BoxConstraints(),
                                icon: Icon(
                                  Icons.comment_outlined,
                                  color: AppTheme.signatureColor,
                                  size: 30,
                                ),
                                onPressed: () {
                                  FocusScope.of(context).requestFocus(focusNode);
                                }
                              )
                            ),
                            Container(
                              padding: EdgeInsets.only(left: 15),
                              alignment: Alignment.center,
                              child: Text(
                                dinerInfo.commentCount.toString(),
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              )
                            )
                          ]
                        )
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
                        color: AppTheme.grey,
                        height: 1
                      ),
                      Column(
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Container(
                                padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                                child: CircleAvatar(
                                  radius: 20,
                                  backgroundColor: AppTheme.signatureColor,
                                  backgroundImage: AssetImage(Images.sampleProfile)
                                )
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: <Widget> [
                                      Text(
                                        '맛집탐험가',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold
                                        )
                                      ),
                                      SizedBox(width: 5),
                                      Text(
                                        '1시간 전',
                                        style: TextStyle(
                                          color: AppTheme.grey
                                        )
                                      )
                                    ]
                                  ),
                                  SizedBox(height: 5),
                                  Text('좋아요 누르고 갑니다. ^^')
                                ]
                              ),
                            ]
                          ),
                          Row(
                            children: <Widget>[
                              Container(
                                padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                                child: CircleAvatar(
                                  radius: 20,
                                  backgroundColor: AppTheme.signatureColor,
                                  backgroundImage: AssetImage(Images.sampleFoodBurger)
                                )
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: <Widget> [
                                      Text(
                                        '정욱',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold
                                        )
                                      ),
                                      SizedBox(width: 5),
                                      Text(
                                        '38분 전',
                                        style: TextStyle(
                                          color: AppTheme.grey
                                        )
                                      )
                                    ]
                                  ),
                                  SizedBox(height: 5),
                                  Text('끝내주는군요!')
                                ]
                              ),
                            ]
                          ),
                          Row(
                            children: <Widget>[
                              Container(
                                padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                                child: CircleAvatar(
                                  radius: 20,
                                  backgroundColor: AppTheme.signatureColor,
                                )
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: <Widget> [
                                      Text(
                                        '지나가던식객',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold
                                        )
                                      ),
                                      SizedBox(width: 5),
                                      Text(
                                        '3분 전',
                                        style: TextStyle(
                                          color: AppTheme.grey
                                        )
                                      )
                                    ]
                                  ),
                                  SizedBox(height: 5),
                                  Text('저도 이번 주말에 가서 한번 먹어봐야겠네요~')
                                ]
                              ),
                            ]
                          ),
                        ]
                      )
                    ],
                  )
                )
              )
            )
          )
        )
      )
    );
  }
}