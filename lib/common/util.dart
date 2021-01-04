import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';

class Util{
  static String getDateFromTimeStamp(String timeStamp){
    String date = timeStamp;
    String dateWithT = date.substring(0, 8) + 'T' + date.substring(8);
    DateTime dateTime = DateTime.parse(dateWithT);

    return DateFormat("yyyy-MMM-dd hh:mm:ss").format(dateTime).toString();
  }

  static toastDisplay(String message) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 15);
  }
}