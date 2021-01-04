import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter_currency/bloc/orderbook_bloc/orderbook_event.dart';
import 'package:flutter_currency/bloc/orderbook_bloc/orderbook_state.dart';
import 'package:flutter_currency/data/api.dart';
import 'package:flutter_currency/model/order_book_model.dart';
import 'package:flutter_currency/model/ticker_data.dart';
import 'package:rxdart/rxdart.dart';


class OrderBookBloc extends Bloc<OrderBookEvent, OrderBookState> {

  OrderBookBloc() : super(OrderBookStateEmpty());

  @override
  Stream<Transition<OrderBookEvent, OrderBookState>> transformEvents(
      Stream<OrderBookEvent> events,
      Stream<Transition<OrderBookEvent, OrderBookState>> Function(
          OrderBookEvent event, )
      transitionFn,
      ) {
    return events
        .debounceTime(const Duration(milliseconds: 300))
        .switchMap(transitionFn);
  }

  @override
  Stream<OrderBookState> mapEventToState(OrderBookEvent event) async* {

    if (event is GetOrderBook) {

      yield OrderBookStateLoading();
      try {

        var response = await API.getOrderBook(event.searchString);
        var mapResponse = json.decode(response.body);

        OrderBookModel data = OrderBookModel.fromJson(mapResponse);

        Comparator<dynamic> sort = (a, b) => - double.parse(a[0]).compareTo(double.parse(b[0]));
        data.asks.sort(sort);
        data.bids.sort(sort);

        yield OrderBookStateSuccess(data);

      } catch (error) {

        OrderBookStateError('something went wrong');
      }

    }else if (event is ClearOrderBook){

      yield OrderBookStateEmpty();
    }
  }
}