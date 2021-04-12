import 'package:diner_book/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:dropdown_below/dropdown_below.dart';

import 'package:diner_book/component/header_bar.dart';


class MyDinerBook extends StatefulWidget {
  MyDinerBook({this.animationController});

  final AnimationController animationController;
  @override
  _MyDinerBookState createState() => _MyDinerBookState();
}

class _MyDinerBookState extends State<MyDinerBook> with TickerProviderStateMixin {
  final valueList = ['최신순', '거리순', '별점순'];
  List<DropdownMenuItem> dropdownItems;
  String selectedValue = '최신순';

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
      selectedValue= selected;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: HeaderBar(
        title: '다이너북'
      ),
      body: Container(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: Stack(
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.symmetric(vertical: 20),
                  child:Row(
                  children:<Widget>[
                      CircleAvatar(
                        radius: 50,
                        backgroundColor: AppTheme.signatureColor,
                        backgroundImage: NetworkImage('https://www.woolha.com/media/2020/03/eevee.png')
                      ),
                      Expanded(
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
                                      child:Text(
                                        '게시물',
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold
                                        )
                                      )
                                    )
                                  )
                                ),
                                Expanded(
                                  child: Container(
                                    padding: EdgeInsets.only(bottom: 10),
                                    child:Center(
                                      child:Text(
                                        '팔로워',
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold
                                        )
                                      )
                                    )
                                  )
                                ),Expanded(
                                  child: Container(
                                    padding: EdgeInsets.only(bottom: 10),
                                    child:Center(
                                      child:Text(
                                        '팔로잉',
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold
                                        )
                                      )
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
                                    child:Text(
                                      '11',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold
                                      )
                                    )
                                  )
                                ),
                                Expanded(
                                  child:Center(
                                    child:Text(
                                      '183',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold
                                      )
                                    )
                                  )
                                ),
                                Expanded(
                                  child:Center(
                                    child:Text(
                                      '171',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold
                                      )
                                    )
                                  )
                                ),
                              ]
                            ),
                          ]
                        )
                      )
                    ]
                  )
                ),
                OutlinedButton(
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
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children:<Widget>[
                    Container(
                      padding: EdgeInsets.only(top: 10),
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
              ]
            ),
            Center(
              child: Text(selectedValue + ' 다이너북')
            )
          ]
        )
      )
    );
  }
}