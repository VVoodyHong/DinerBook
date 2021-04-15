import 'package:diner_book/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:dropdown_below/dropdown_below.dart';

import 'package:diner_book/component/header_bar.dart';
import 'package:diner_book/common/images.dart';
import 'package:diner_book/models/diner_info.dart';
import 'package:diner_book/component/bottom_bar.dart';


class MyDinerBook extends StatefulWidget {
  MyDinerBook({this.animationController});

  final AnimationController animationController;
  @override
  _MyDinerBookState createState() => _MyDinerBookState();
}

class _MyDinerBookState extends State<MyDinerBook> with TickerProviderStateMixin {
  bool showProfile = true;
  String selectedValue = '최신순';
  final valueList = ['최신순', '거리순', '별점순'];
  List<DropdownMenuItem> dropdownItems;
  List<dynamic> dinerList;
  String filter = '전체';
  List<String> filterList = [
    '전체',
    '한식',
    '중식',
    '양식',
    '일식',
    '해산물',
    '패스트푸드',
    '베이커리',
    '커피',
    '기타',
  ];

  @override
  void initState() {
    dropdownItems = buildDropdownTestItems(valueList);
    super.initState();
  }

  List<DropdownMenuItem> buildDropdownTestItems(List _testList) {
    List<DropdownMenuItem> items = [];
    for (var i in _testList) {
      items.add(
        DropdownMenuItem(
          value: i,
          child: Text(i),
        ),
      );
    }
    return items;
  }

  onChangeDropdown(selected) {
    setState(() {
      selectedValue = selected;
    });
  }

  onPressRightBtn() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Container(
            width: MediaQuery.of(context).size.width / 4,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                ConstrainedBox(
                  constraints: BoxConstraints(
                    maxHeight: MediaQuery.of(context).size.height / 4,
                  ),
                  child: ListView.builder(
                      shrinkWrap: true,
                      physics: BouncingScrollPhysics(),
                      itemCount: filterList.length,
                      itemBuilder: (BuildContext context, int index){
                        return Column(
                          children: <Widget> [
                            GestureDetector(
                              onTap:() {
                                  setState(() {
                                    filter = filterList[index];
                                  });
                                  Navigator.pop(context);
                                },
                              child: Container(
                                padding: EdgeInsets.symmetric(vertical: 10),
                                child: TextContainer(filterList[index])
                              )
                            ),
                            index != filterList.length - 1 ? Divider() : Container()
                          ]
                        );
                      }
                  ),
                ),
              ],
            ),
          ),
        );
      }
    );
  }

  Widget TextContainer(text) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    dinerList = [];
    for ( int i = 0; i < 25; i++) {
      dinerList.add(DinerInfo(name: selectedValue + ' 식당'+(i+1).toString()));
    }
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: HeaderBar(
        title: '다이너북',
        filter: filter,
        isDinerBook: true,
        onPressRightBtn: onPressRightBtn
      ),
      body: Container(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: Stack(
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  padding: showProfile ? EdgeInsets.symmetric(vertical: 20) : EdgeInsets.symmetric(vertical: 5), 
                  child:Row(
                  children:<Widget>[
                      showProfile ? CircleAvatar(
                        radius: 50,
                        backgroundColor: AppTheme.signatureColor,
                        backgroundImage: AssetImage(Images.sampleProfile)
                      ) : Container(),
                      showProfile ? Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children:[
                                Expanded(
                                  child: Container(
                                    padding: EdgeInsets.only(bottom: 10),
                                    child:Center(
                                      child:TextContainer('게시물')
                                    )
                                  )
                                ),
                                Expanded(
                                  child: Container(
                                    padding: EdgeInsets.only(bottom: 10),
                                    child:Center(
                                      child:TextContainer('팔로워')
                                    )
                                  )
                                ),Expanded(
                                  child: Container(
                                    padding: EdgeInsets.only(bottom: 10),
                                    child:Center(
                                      child:TextContainer('팔로잉')
                                    )
                                  )
                                ),
                              ]
                            ),
                             Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children:[
                                Expanded(
                                  child:Center(
                                    child:TextContainer('11')
                                  )
                                ),
                                Expanded(
                                  child:Center(
                                    child:TextContainer('184')
                                  )
                                ),
                                Expanded(
                                  child:Center(
                                    child:TextContainer('168')
                                  )
                                ),
                              ]
                            ),
                          ]
                        )
                      ) : Container()
                    ]
                  )
                ),
                showProfile ? Container(
                  padding: EdgeInsets.only(bottom: 10),
                  child: OutlinedButton(
                    style: ButtonStyle(
                      elevation: MaterialStateProperty.all<double>(4.0),
                      backgroundColor: MaterialStateProperty.all<Color>(AppTheme.signatureColor),
                      shadowColor: MaterialStateProperty.all<Color>(AppTheme.grey)
                    ),
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text("프로필 편집"),
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
                                },
                              ),
                            ],
                          );
                        },
                      );
                    },
                    child: Container(
                      height: MediaQuery.of(context).size.height / 20,
                      width: MediaQuery.of(context).size.width,
                      alignment: Alignment.center,
                      child: Text(
                        '프로필 편집',
                        style: TextStyle(
                          color: AppTheme.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        )
                      )
                    )
                  )
                ) : Container(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children:<Widget>[
                    OutlinedButton(
                      style: ButtonStyle(
                        elevation: MaterialStateProperty.all<double>(1.5),
                        backgroundColor: MaterialStateProperty.all<Color>(AppTheme.white),
                      ),
                      onPressed: () {setState(() {showProfile = !showProfile;});},
                      child: Text(
                        showProfile ? '프로필 접기' : '프로필 펼치기',
                        style: TextStyle(
                          color: Colors.black
                        )
                      )
                    ),
                    Container(
                      child: DropdownBelow(
                        iconSize: 20,
                        itemWidth: 100,
                        itemTextstyle: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Colors.black
                        ),
                        boxTextstyle: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Colors.black
                        ),
                        boxPadding: EdgeInsets.fromLTRB(12, 12, 6, 12),
                        boxWidth: 95,
                        boxHeight: 45,
                        hint: Text(selectedValue),
                        value: selectedValue,
                        items: dropdownItems,
                        onChanged: onChangeDropdown,
                      )
                    )
                  ]
                ),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.only(top: 10),
                    child: ListView.builder(
                      itemCount:  dinerList.length,
                      physics: BouncingScrollPhysics(),
                      padding: EdgeInsets.only(bottom: BottomBar().preferredSize.height),
                      itemBuilder: (context, index) {
                        return (
                          Container(
                            height: MediaQuery.of(context).size.height / 7,
                            padding: EdgeInsets.only(bottom: 10),
                            child: OutlinedButton(
                              style: ButtonStyle(
                                elevation: MaterialStateProperty.all<double>(1.5),
                                backgroundColor: MaterialStateProperty.all<Color>(AppTheme.white),
                              ),
                              onPressed: () {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: Text(dinerList[index].name + " 페이지로 이동"),
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
                              child: Text(
                                dinerList[index].name,
                                style: TextStyle(
                                  color: Colors.black
                                )
                              )
                            )
                          )
                        );
                      }
                    )
                  )
                )
              ]
            )
          ]
        )
      )
    );
  }
}