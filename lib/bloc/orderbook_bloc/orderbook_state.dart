import 'package:equatable/equatable.dart';
import 'package:flutter_currency/model/order_book_model.dart';

abstract class OrderBookState extends Equatable {
  const OrderBookState();

  @override
  List<Object> get props => [];
}

class OrderBookStateEmpty extends OrderBookState {}

class OrderBookStateLoading extends OrderBookState {}

class OrderBookStateSuccess extends OrderBookState {
  final OrderBookModel items;

  const OrderBookStateSuccess(this.items);

  @override
  List<Object> get props => [items];

  @override
  String toString() => 'OrderBookStateSuccess { items: ${items} }';
}

class OrderBookStateError extends OrderBookState {
  final String error;

  const OrderBookStateError(this.error);

  @override
  List<Object> get props => [error];
}