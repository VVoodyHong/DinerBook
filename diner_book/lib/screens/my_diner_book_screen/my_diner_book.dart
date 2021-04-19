import 'package:diner_book/widget/diner_view.dart';
import 'package:flutter/material.dart';
import 'package:dropdown_below/dropdown_below.dart';

import 'package:diner_book/common/images.dart';
import 'package:diner_book/app_theme.dart';
import 'package:diner_book/models/diner_info.dart';
import 'package:diner_book/widget/header_bar.dart';
import 'package:diner_book/widget/bottom_bar.dart';


class MyDinerBookScreen extends StatefulWidget {
  final AnimationController animationController;

  MyDinerBookScreen({this.animationController});
  @override
  _MyDinerBookScreenState createState() => _MyDinerBookScreenState();
}

class _MyDinerBookScreenState extends State<MyDinerBookScreen> with TickerProviderStateMixin {
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
    '카페',
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
          contentPadding: EdgeInsets.fromLTRB(0, 5, 0, 5),
          content: Container(
            width: MediaQuery.of(context).size.width / 2,
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
                                height: MediaQuery.of(context).size.height * 0.05,
                                width: MediaQuery.of(context).size.width / 2,
                                child: Center(
                                    child: textContainer(filterList[index])
                                ),
                                decoration: BoxDecoration(
                                  border: Border(
                                    bottom: BorderSide(
                                      width:  1 ,
                                      color: index != filterList.length - 1 ? Colors.grey[300] : Colors.white
                                    )
                                  )
                                )
                              )
                            ),
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

  Widget textContainer(text) {
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
    for (int i = 0; i < 25; i++) {
      if(i % 4 == 0) {
        dinerList.add(
          DinerInfo(
            dinerName: '롯데리아',
            foodName: '한우불고기버거',
            starRating: 5,
            updateAt: '2021. 03. 17',
            address: '부산광역시 금정구 장전로 13',
            distance: 9.2,
            thumbnailPath: Images.sampleFoodBurger,
            category: '패스트푸드'
            
          )
        );
      } else if (i % 4 == 1) {
        dinerList.add(
          DinerInfo(
            dinerName: '미스터 피자',
            foodName: '피자',
            starRating: 4,
            updateAt: '2021. 04. 25',
            address: '부산광역시 부산진구 전포대로 186번길 24',
            distance: 1.5,
            thumbnailPath: Images.sampleFoodPizza,
            category: '패스트푸드'
            
          )
        );
      } else if (i % 4 == 2) {
        dinerList.add(
          DinerInfo(
            dinerName: '교촌 치킨',
            foodName: '치킨',
            starRating: 4.5,
            updateAt: '2021. 04. 11',
            address: '부산광역시 영도구 본산남길 11',
            distance: 18.2,
            thumbnailPath: Images.sampleFoodChicken,
            category: '패스트푸드'
            
          )
        );
      } else if (i % 4 == 3) {
        dinerList.add(
          DinerInfo(
            dinerName: '스푼 필라프',
            foodName: '까르보나라',
            starRating: 3,
            updateAt: '2021. 01. 03',
            address: '부산광역시 중구 남포대로 22',
            distance: 10.5,
            thumbnailPath: Images.sampleFoodCarbonara,
            category: '양식'
            
          )
        );
      }
    }

    return Container(
      color: AppTheme.background,
      child: SafeArea(
        child: Scaffold(
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
                                        child: Center(
                                          child: textContainer('다이너')
                                        )
                                      )
                                    ),
                                    Expanded(
                                      child: Container(
                                        padding: EdgeInsets.only(bottom: 10),
                                        child: Center(
                                          child: textContainer('팔로워')
                                        )
                                      )
                                    ),Expanded(
                                      child: Container(
                                        padding: EdgeInsets.only(bottom: 10),
                                        child: Center(
                                          child: textContainer('팔로잉')
                                        )
                                      )
                                    ),
                                  ]
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children:[
                                    Expanded(
                                      child: Center(
                                        child: textContainer(dinerList.length.toString())
                                      )
                                    ),
                                    Expanded(
                                      child: Center(
                                        child: textContainer('184')
                                      )
                                    ),
                                    Expanded(
                                      child: Center(
                                        child: textContainer('168')
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
                    filter == '전체' ?
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.only(top: 10),
                        child: ListView.builder(
                          itemCount:  dinerList.length,
                          physics: BouncingScrollPhysics(),
                          padding: EdgeInsets.only(bottom: BottomBar().preferredSize.height),
                          itemBuilder: (context, index) {
                            return (
                              DinerView(
                                dinerInfo: dinerList[index]
                              )
                            );
                          }
                        )
                      )
                    ) : Expanded(
                      child: Container(
                        padding: EdgeInsets.only(top: 10),
                        child: ListView.builder(
                          itemCount:  dinerList.length,
                          physics: BouncingScrollPhysics(),
                          padding: EdgeInsets.only(bottom: BottomBar().preferredSize.height),
                          itemBuilder: (context, index) {
                            if(dinerList[index].category == filter) {
                              return (
                                DinerView(
                                  dinerInfo: dinerList[index]
                                )
                              );
                            } else return Container();
                          }
                        )
                      )
                    )
                  ]
                )
              ]
            )
          )
        )
      )
    );
  }
}