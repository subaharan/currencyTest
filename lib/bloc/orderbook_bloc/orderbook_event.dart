import 'package:equatable/equatable.dart';

abstract class OrderBookEvent extends Equatable{
  const OrderBookEvent();
}

class GetOrderBook extends OrderBookEvent{
  final String searchString;

  const GetOrderBook({this.searchString});

  @override
  List<Object> get props => [];

  @override
  String toString() => 'GetOrderBook { searchString: "", }';
}

class ClearOrderBook extends OrderBookEvent{

  const ClearOrderBook();

  @override
  List<Object> get props => [];

  @override
  String toString() => 'ClearOrderBook { }';
}