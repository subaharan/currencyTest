import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:skeleton_loader/skeleton_loader.dart';

class OrderBookLoading extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return SkeletonLoader(
      builder: Container(
        margin: EdgeInsets.only(top: 15),
        height: 200,
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Column(
          children: <Widget>[
            Container(
              width: double.infinity,
              height: 15,
              color: Colors.white,
            ),
            SizedBox(height: 10),
            Container(
              width: double.infinity,
              height: 15,
              color: Colors.white,
            ),
            SizedBox(height: 10),
            Container(
              width: double.infinity,
              height: 15,
              color: Colors.white,
            ),
            SizedBox(height: 10),
            Container(
              width: double.infinity,
              height: 15,
              color: Colors.white,
            ),
            SizedBox(height: 10),
            Container(
              width: double.infinity,
              height: 15,
              color: Colors.white,
            ),
          ],
        ),
      ),
      items: 1,
      period: Duration(seconds: 2),
      highlightColor: Colors.blue[300],
      direction: SkeletonDirection.ltr,
    );
  }

}