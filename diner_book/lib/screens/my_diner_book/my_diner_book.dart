import 'package:flutter/material.dart';
import 'package:dropdown_below/dropdown_below.dart';

import 'package:diner_book/app_theme.dart';
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
              children: <Widget>[
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