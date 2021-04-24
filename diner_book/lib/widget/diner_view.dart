import 'package:flutter/material.dart';

import 'package:diner_book/app_theme.dart';
import 'package:diner_book/models/diner_info.dart';

class DinerView extends StatefulWidget {
  final DinerInfo dinerInfo;

  DinerView({this.dinerInfo});

  @override
  _DinerViewState createState() => _DinerViewState();
}

class _DinerViewState extends State<DinerView> {

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 7,
      padding: EdgeInsets.only(bottom: 10),
      child: OutlinedButton(
        style: ButtonStyle(
          elevation: MaterialStateProperty.all<double>(1.5),
          backgroundColor: MaterialStateProperty.all<Color>(AppTheme.white),
        ),
        onPressed: () {
          Navigator.pushNamed(
            context, '/DinerBook/detail',
            arguments: {
            'dinerInfo': widget.dinerInfo

          });
        },
        child: Row(
          children: <Widget>[
            widget.dinerInfo.thumbnailPath != '' ?
            Container(
              height: MediaQuery.of(context).size.height / 10,
              width: MediaQuery.of(context).size.height / 10,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: AssetImage(
                    widget.dinerInfo.thumbnailPath
                  ),
                  fit: BoxFit.cover
                )
              )
            ) :
            Container(
              height: MediaQuery.of(context).size.height / 10,
              width: MediaQuery.of(context).size.height / 10,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: AppTheme.signatureColor
              ),
              child: Center(
                child: Text(
                  'No Image',
                  style: TextStyle(
                    color: Colors.white
                  )
                )
              )
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Flexible(
                        child:Row(
                          children: <Widget>[
                            Flexible(
                              child: Container(
                                padding: EdgeInsets.fromLTRB(10, 15, 0, 0),
                                child: Text(
                                  widget.dinerInfo.foodName,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                )
                              )
                            ),
                            Container(
                              padding: EdgeInsets.fromLTRB(5, 15, 0, 0),
                              child: Icon(
                                Icons.star,
                                color: AppTheme.signatureColor,
                                size: 15,
                              )
                            ),
                            Container(
                              padding: EdgeInsets.fromLTRB(3, 15, 10, 0),
                              child: Text(
                                widget.dinerInfo.starRating.toString(),
                                style: TextStyle(
                                  color: Colors.black,
                                  // fontWeight: FontWeight.w400,
                                ),
                              )
                            ),
                          ]
                        )
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(0, 15, 10, 0),
                        child: Text(
                          widget.dinerInfo.updateAt,
                          style: TextStyle(
                            color: AppTheme.grey,
                          )
                        )
                      ),
                    ]
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.fromLTRB(10, 0, 0, 15),
                            child: Icon(
                              Icons.favorite,
                              color: AppTheme.signatureColor,
                              size: 15,
                            )
                          ),
                          Container(
                            padding: EdgeInsets.fromLTRB(3, 0, 0, 15),
                            child: Text(
                              widget.dinerInfo.likeCount.toString(),
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w400,
                              ),
                            )
                          ),
                          Container(
                            padding: EdgeInsets.fromLTRB(10, 0, 0, 13),
                            child: Icon(
                              Icons.comment_outlined,
                              color: AppTheme.signatureColor,
                              size: 15,
                            )
                          ),
                          Container(
                            padding: EdgeInsets.fromLTRB(3, 0, 0, 15),
                            child: Text(
                              widget.dinerInfo.commentCount.toString(),
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w400,
                              ),
                            )
                          ),
                        ]
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(0, 0, 10, 15),
                        child: Text(
                          widget.dinerInfo.starRating.toString() + 'km',
                          style: TextStyle(
                            color: AppTheme.grey
                          )
                        )
                      ),
                    ],
                  )
                ],
              )
            ),
          ],
        )
      )
    );
  }
}