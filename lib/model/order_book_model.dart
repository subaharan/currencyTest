
class OrderBookModel {
  String timestamp;
  String microtimestamp;
  dynamic bids = new List<List<String>>();
  dynamic asks = new List<List<String>>();

  OrderBookModel(String _timestamp, String _microtimestamp, List<List<String>> _bids, List<List<String>> _asks)
  {
    this.timestamp = _timestamp;
    this.microtimestamp = _microtimestamp;
    this.bids = _bids;
    this.asks = _asks;
  }

  OrderBookModel.fromJson(Map json)
      : timestamp = json['timestamp'],
        microtimestamp = json['microtimestamp'],
        bids = json['bids'],
        asks = json['asks'];

  Map toJson() {
    return {
      'timestamp' :timestamp,
      'microtimestamp' :microtimestamp,
      'bids' :bids,
      'asks' :asks
    };
  }

}