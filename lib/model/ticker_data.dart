
class Ticker_data {
  String _volume;
  String _last;
  String _timestamp;
  String _bid;
  String _vwap;
  String _high;
  String _low;
  String _ask;
  double _open;

  String get volume => _volume;
  String get last => _last;
  String get timestamp => _timestamp;
  String get bid => _bid;
  String get vwap => _vwap;
  String get high => _high;
  String get low => _low;
  String get ask => _ask;
  double get open => _open;

  Ticker_data({
      String volume, 
      String last, 
      String timestamp, 
      String bid, 
      String vwap, 
      String high, 
      String low, 
      String ask, 
      double open}){
    _volume = volume;
    _last = last;
    _timestamp = timestamp;
    _bid = bid;
    _vwap = vwap;
    _high = high;
    _low = low;
    _ask = ask;
    _open = open;
}

  Ticker_data.fromJson(dynamic json) {
    _volume = json["volume"];
    _last = json["last"];
    _timestamp = json["timestamp"];
    _bid = json["bid"];
    _vwap = json["vwap"];
    _high = json["high"];
    _low = json["low"];
    _ask = json["ask"];
    _open = json["open"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["volume"] = _volume;
    map["last"] = _last;
    map["timestamp"] = _timestamp;
    map["bid"] = _bid;
    map["vwap"] = _vwap;
    map["high"] = _high;
    map["low"] = _low;
    map["ask"] = _ask;
    map["open"] = _open;
    return map;
  }

}