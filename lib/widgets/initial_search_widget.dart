import 'package:flutter/material.dart';
import 'package:flutter_currency/common/strings.dart';

class IntialSearchWidget extends StatelessWidget {
  // IntialSearchWidget({this.width, this.height});
  // final double width;
  // final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20),
      child: Column(
        children: [
          Icon(
            Icons.search,
            size: 150,
            color: Colors.grey,
          ),
          SizedBox(
            height: 15,
          ),
          Text(
            Strings.enter_currency_pair_load_data,
            style: TextStyle(
              color: Colors.black87,
              fontSize: 14,
              fontFamily: "ProximaNova",
              fontWeight: FontWeight.bold,
            ),
          )
        ],
      ),
    );
  }
}