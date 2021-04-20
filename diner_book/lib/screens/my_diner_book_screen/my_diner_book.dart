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
      if(i % 5 == 0) {
        dinerList.add(
          DinerInfo(
            dinerName: '스푼필라프',
            foodName: '까르보나라',
            starRating: 3,
            updateAt: '2021. 01. 03',
            address: '부산광역시 중구 남포대로 22',
            distance: 10.5,
            thumbnailPath: Images.sampleFoodCarbonara,
            category: '양식',
            likeCount: 19,
            commentCount: 3,
            comment: '대식가로 알려진 이탈리아 사람들도 점심은 간단하게 파스타 한 접시를 먹는 것이 일반적이다. 레스토랑에 들어서면 여러 종류의 파스타가 적혀 있지만 이탈리아 어느 곳을 가더라도 메뉴에서 빠뜨리지 않는 것이 바로 카르보나라(Carbonara)이다. 카르보나라는 토마토소스, 오일 파스타와 더불어 크림파스타의 기본이라고 할 만큼 대중적인 인기를 지니고 있는 파스타이다. 크림소스로 만든 파스타 요리 중 가장 많이 알려진 카르보나라는 베이컨, 치즈, 달걀노른자를 이용해 만들기 때문에 부드러운 맛이 인상적이다.'
            
          )
        );
      } else if (i % 5 == 1) {
        dinerList.add(
          DinerInfo(
            dinerName: '피자스쿨',
            foodName: '피자',
            starRating: 4,
            updateAt: '2021. 04. 25',
            address: '부산광역시 부산진구 전포대로 186번길 24',
            distance: 1.5,
            thumbnailPath: Images.sampleFoodPizza,
            category: '패스트푸드',
            likeCount: 33,
            commentCount: 12,
            comment: '진리의 핫치킨 + 더블 포테이토' 
          )
        );
      } else if (i % 5 == 2) {
        dinerList.add(
          DinerInfo(
            dinerName: '교촌치킨',
            foodName: '치킨',
            starRating: 4.5,
            updateAt: '2021. 04. 11',
            address: '부산광역시 영도구 본산남길 11',
            distance: 18.2,
            thumbnailPath: Images.sampleFoodChicken,
            category: '패스트푸드',
            likeCount: 41,
            commentCount: 15,
            comment: '토막난 닭고기에 양념을 한 뒤 밀가루나 전분 등을 묻히고 끓는 기름에 튀긴 요리이다. 현재는 조각내지 않고 튀기거나, 기름에 튀기지 않는 방식의 요리도 치킨이라 불리고 있으며 그 외 다양한 변형들이 만들어지고 있다. 즉, 프라이드 치킨의 줄임말로 시작했지만 튀김 방식이 아닌 새로운 닭요리를 통칭하는 용어로 사용되고 있다. 때문에 치킨과 통닭을 같은 뜻으로 사용하는 사람도 많아졌다. 강냉이와 옥수수를 같은 뜻으로 이해하는 것과 비슷하다. 한국에 들어와서 의미가 변형되었으며, 영단어 Chicken의 원뜻은 (요리로서가 아닌 살아있는 동물 그 자체도 의미하는)이다. 한국 내 패스트푸드 3대장인 피자, 햄버거, 치킨 중 압도적인 원탑의 위치를 점하고 있다. 출출해지는 밤을 달래주는 한국인들의 주요 야식 중 하나이다. 밤에 TV나 영화를 보며 먹는 치맥(또는 치콜)은 그야말로 최고의 요깃거리라 할 수 있다. 한국의 프라이드 치킨은 배달 문화와 맞물려 널리 퍼져나갔으며, 다양한 방식과 맛으로 변화를 거치면서 짜장면처럼 로컬라이징된 한국 특유의 음식으로 각광받고 있다. 얼마나 규모 컸으면 전세계의 맥도날드 매장보다 한국 치킨집 개수가 더 많다!'
            
          )
        );
      } else if (i % 5 == 3) {
        dinerList.add(
          DinerInfo(
            dinerName: '장터돼지국밥',
            foodName: '돼지국밥',
            starRating: 5,
            updateAt: '2020. 11. 11',
            address: '부산대학교 젊음의 거리',
            distance: 8.5,
            thumbnailPath: '',
            category: '한식',
            likeCount: 83,
            commentCount: 26,
            comment: '돼지 뼈를 삶은 구수한 국물에 삶은 돼지고기와 채소를 넣고 매운 양념, 새우젓을 넣어 먹는 고깃국이다.\n재료 및 분량 (4인분) 흰밥 4공기(920g), 돼지고기 500g, 된장 1큰술, 생강(편) 10g, 청주 4큰술, 물 8컵(2L), 엄나무 가지 4개(30g), 물 10컵(2.5L), 대파 1대(30g), 청양고추 1개(15g), 부추 60g,\n양념 고춧가루 4큰술, 고추장 2큰술, 다진 생강 1작은술, 다진 마늘 2큰술, 소금 · 후춧가루 약간씩\n곁들임 들깨 가루, 새우젓'
            
          )
        );
      } else if (i % 5 == 4) {
        dinerList.add(
          DinerInfo(
            dinerName: '롯데리아',
            foodName: '한우불고기버거',
            starRating: 5,
            updateAt: '2021. 03. 17',
            address: '부산광역시 금정구 장전로 13',
            distance: 9.2,
            thumbnailPath: Images.sampleFoodBurger,
            category: '패스트푸드',
            likeCount: 17,
            commentCount: 5,
            comment: '패티를 구운 후 빵 사이에 끼워먹는 음식이다. 세계화의 바이블급 인지도를 자랑하는 넘버원 페스트 푸드로, 세계로 퍼지는 과정에서 각종 문화가 뒤섞이다 보니 이것을 바탕으로 만든 온갖 바리에이션 음식들이 등장했다. 때문에 어원과는 무관하게 햄버거처럼 만든 겹빵 음식이라는 의미인 버거(Burger)라는 접미형 신조어도 만들어냈을 정도. 이러한 접미방식이 처음으로 사용된 음식은 치즈버거라고 한다. 이름이 유사하기 때문에 햄버그 스테이크와 헷갈리는 경우가 많다. 정확히는 원래 햄버거의 어원은 "햄버그 샌드위치" 즉, "햄버그 스테이크를 패티로 쓴 샌드위치"이기 때문이다. 따라서 햄버그 스테이크가 아닌 다른 육류를 패티로 만든 것들은 엄밀히 따지면 "햄버거"가 아니다. 하지만 현대 영어에서 버거 (burger) 라는 단어가 햄버거에서 독립된 용어로 사용되면서, 치킨 버거, 터키(칠면조) 버거와 같은 단어가 생겨났다. 따라서 영미권에서 치킨 "버거"와 같은 용어도 점차 정착하고 있다. 오히려 zinger burger같은 경우 구글 검색 기준으로 zinger sandwich의 3배 정도 되는 검색 결과가 나오니 같은 영어권이어도 본고장인 북미권 밖에서는 버거 쪽이 더 보편적인 표현이 됐다고 주장할 수도 있는 상황이다.'
            
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
            child: Column(
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
          )
        )
      )
    );
  }
}