import 'package:flutter/material.dart';
import 'package:skeleton_loader/skeleton_loader.dart';

class CurrencyLoading extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return SkeletonLoader(
      builder: Container(
        height: 200,
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Container(
          width: double.infinity,
          height: 200,
          color: Colors.white,
        ),
      ),
      items: 1,
      period: Duration(seconds: 2),
      highlightColor: Colors.blue[300],
      direction: SkeletonDirection.ltr,
    );
  }
  
}