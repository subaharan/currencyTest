import 'dart:async';

import 'package:http/http.dart' as http;


class API {
  static final baseUrl = "https://www.bitstamp.net/api/";


  static Future getCurrencyData(var searchString) async {
    var url = baseUrl + "ticker/${searchString}";
    print(url);
    return http.get(url, headers: {"Accept": "application/json"});
  }

  static Future getOrderBook(var searchString) async {
    var url = baseUrl + "order_book/${searchString}";
    print(url);
    return http.get(url, headers: {"Accept": "application/json"});
  }


}
