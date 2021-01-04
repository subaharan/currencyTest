import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_currency/bloc/orderbook_bloc/orderbook_bloc.dart';
import 'package:flutter_currency/bloc/orderbook_bloc/orderbook_state.dart';
import 'package:flutter_currency/common/strings.dart';
import 'package:flutter_currency/widgets/orderbook_loading.dart';
import 'package:skeleton_loader/skeleton_loader.dart';

class OrderBookPage extends StatefulWidget {
  @override
  State<OrderBookPage> createState() => _OrderBookPageState();
}

class _OrderBookPageState extends State<OrderBookPage> {
  ScrollController _controller;

  @override
  void initState() {
    super.initState();
    _controller = ScrollController();
    _controller.addListener(_scrollListener);
  }

  _scrollListener() {
    if (_controller.offset >= _controller.position.maxScrollExtent &&
        !_controller.position.outOfRange) {}
    if (_controller.offset <= _controller.position.minScrollExtent &&
        !_controller.position.outOfRange) {}
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrderBookBloc, OrderBookState>(
      builder: (context, state) {
        if (state is OrderBookStateEmpty) {
          return new Container();
        }
        if (state is OrderBookStateLoading) {
          return OrderBookLoading();
        }
        if (state is OrderBookStateError) {
          return Text(state.error);
        }
        if (state is OrderBookStateSuccess) {
          return Container(
            margin: EdgeInsets.symmetric(horizontal: 5, vertical: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  Strings.order_book.toUpperCase(),
                  style: TextStyle(
                    color: Colors.black87,
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Card(
                  shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(10)),
                  color: Colors.white,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                            left: 8.0, right: 8, top: 10, bottom: 10),
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(Strings.bid_price.toUpperCase(),
                                  style: TextStyle(
                                    color: Colors.black87,
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold,
                                  )),
                            ),
                            Expanded(
                              child: Text(
                                Strings.qty.toUpperCase(),
                                style: TextStyle(
                                  color: Colors.black87,
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Expanded(
                              child: Text(
                                Strings.qty.toUpperCase(),
                                style: TextStyle(
                                  color: Colors.black87,
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Expanded(
                              child: Text(
                                Strings.ask_price.toUpperCase(),
                                style: TextStyle(
                                  color: Colors.black87,
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.right,
                              ),
                            ),
                          ],
                        ),
                      ),
                      ListView.builder(
                        shrinkWrap: true,
                        controller: _controller,
                        itemCount: 5,
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Text(state.items.bids[index][0],
                                      style: TextStyle(
                                        color: Colors.black87,
                                        fontSize: 10,
                                        fontWeight: FontWeight.bold,
                                      )),
                                ),
                                Expanded(
                                  child: Text(
                                    state.items.bids[index][1],
                                    style: TextStyle(
                                      color: Colors.black87,
                                      fontSize: 10,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                Expanded(
                                  child: Text(
                                    state.items.asks[index][1],
                                    style: TextStyle(
                                      color: Colors.black87,
                                      fontSize: 10,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                Expanded(
                                  child: Text(
                                    state.items.asks[index][0],
                                    style: TextStyle(
                                      color: Colors.black87,
                                      fontSize: 10,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    textAlign: TextAlign.right,
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                      SizedBox(
                        height: 10,
                      )
                    ],
                  ),
                )
              ],
            ),
          );
        }
        return const Text('');
      },
    );
  }
}
