import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_currency/bloc/orderbook_bloc/orderbook_bloc.dart';
import 'package:flutter_currency/bloc/orderbook_bloc/orderbook_event.dart';
import 'package:flutter_currency/bloc/search_bloc/search_bloc.dart';
import 'package:flutter_currency/bloc/search_bloc/search_event.dart';
import 'package:flutter_currency/bloc/search_bloc/search_state.dart';
import 'package:flutter_currency/common/strings.dart';
import 'package:flutter_currency/common/util.dart';
import 'package:flutter_currency/data/local_data.dart';
import 'package:flutter_currency/widgets/currency_loading.dart';
import 'package:flutter_currency/widgets/initial_search_widget.dart';

import 'order_book.dart';


class MyHomePage extends StatefulWidget {

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

OrderBookBloc _orderBookBloc;
// bool searchCalled = false;
class _MyHomePageState extends State<MyHomePage> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _orderBookBloc = BlocProvider.of<OrderBookBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: SafeArea(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 10,
            ),
            _SearchBar(),
            _CurrencyData(),
           /* Align(
              alignment: Alignment.centerRight,
                child: orderBook==null?new Container():_viewOrderBook()
            ),
            OrderBookPage()*/
          ],
        ),
      ),

      floatingActionButton: BlocBuilder<SearchBloc, SearchState>(
        builder: (context, state) {
          if (state is SearchStateSuccess) {
            return FloatingActionButton(
              onPressed:(){
                _orderBookBloc.add(ClearOrderBook());
                _searchBloc.add(TextSearched(searchString: _textController.text),);
              },
              tooltip: 'refresh',
              child: Icon(
                Icons.autorenew,
                color: Colors.white,
              ),
            );
          }else{
            return new Container();
          }
          return const Text('');
        },
      ) , // This trailing comma makes auto-formatting nicer for build methods.
    );
  }


}

final _textController = TextEditingController();
SearchBloc _searchBloc;

class _SearchBar extends StatefulWidget {
  @override
  State<_SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<_SearchBar> {


  @override
  void initState() {
    super.initState();
    _searchBloc = BlocProvider.of<SearchBloc>(context);
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: TextFormField(
          controller: _textController,
          decoration: new InputDecoration(
            filled: true,
            hintStyle: new TextStyle(color: Colors.black54),
            hintText: Strings.enter_currency_pair,
            fillColor: Colors.grey.shade200,
            border: InputBorder.none,
            suffixIcon: IconButton(
              padding: const EdgeInsets.all(5),
              icon: Icon(
                Icons.search,
                color: Colors.black54,
              ),
              onPressed: () {
                if(_textController.text.length==0){
                  Util.toastDisplay(Strings.please_enter_currency_pair);
                }else if(LocalData.currencyList.contains(_textController.text)){
                  _orderBookBloc.add(ClearOrderBook());
                  _searchBloc.add(
                    TextSearched(searchString: _textController.text),
                  );
                }else{
                  Util.toastDisplay(Strings.invalid_currency_pair);
                }

              },
            ),
          )),
    );
  }
}

class _CurrencyData extends StatefulWidget {
  @override
  State<_CurrencyData> createState() => _CurrencyDataState();
}

class _CurrencyDataState extends State<_CurrencyData> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchBloc, SearchState>(
      builder: (context, state) {
        if (state is SearchStateEmpty) {
          return IntialSearchWidget();
        }
        if (state is SearchStateLoading) {
          return CurrencyLoading();
        }
        if (state is SearchStateError) {
          return Text(state.error);
        }
        if (state is SearchStateSuccess) {
          return Container(
            margin: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(_textController.text.toUpperCase(),
                        style: TextStyle(
                          color: Colors.black87,
                          fontSize: 22,
                          fontWeight: FontWeight.normal,
                        )),
                    Spacer(),
                    Text(Util.getDateFromTimeStamp(state.items.timestamp),
                        style: TextStyle(
                          color: Colors.black87,
                          fontSize: 12,
                          fontWeight: FontWeight.normal,
                        )),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    Expanded(
                        child: RichText(
                      textAlign: TextAlign.start,
                      text: TextSpan(
                          text: Strings.open.toUpperCase(),
                          style: TextStyle(
                            color: Colors.black87,
                            fontSize: 10,
                            fontWeight: FontWeight.normal,
                          ),
                          children: <TextSpan>[
                            TextSpan(
                                text: "\n\$ ${state.items.open}",
                                style: TextStyle(
                                    color: Colors.black87,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold)),
                          ]),
                    )),
                    Expanded(
                        child: RichText(
                      textAlign: TextAlign.start,
                      text: TextSpan(
                          text: Strings.high.toUpperCase(),
                          style: TextStyle(
                            color: Colors.black87,
                            fontSize: 10,
                            fontWeight: FontWeight.normal,
                          ),
                          children: <TextSpan>[
                            TextSpan(
                                text: "\n\$ ${state.items.high}",
                                style: TextStyle(
                                    color: Colors.black87,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold)),
                          ]),
                    ))
                  ],
                ),

                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Expanded(
                        child: RichText(
                          textAlign: TextAlign.start,
                          text: TextSpan(
                              text: Strings.low.toUpperCase(),
                              style: TextStyle(
                                color: Colors.black87,
                                fontSize: 10,
                                fontWeight: FontWeight.normal,
                              ),
                              children: <TextSpan>[
                                TextSpan(
                                    text: "\n\$ ${state.items.low}",
                                    style: TextStyle(
                                        color: Colors.black87,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold)),
                              ]),
                        )),
                    Expanded(
                        child: RichText(
                          textAlign: TextAlign.start,
                          text: TextSpan(
                              text: Strings.last.toUpperCase(),
                              style: TextStyle(
                                color: Colors.black87,
                                fontSize: 10,
                                fontWeight: FontWeight.normal,
                              ),
                              children: <TextSpan>[
                                TextSpan(
                                    text: "\n\$ ${state.items.last}",
                                    style: TextStyle(
                                        color: Colors.black87,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold)),
                              ]),
                        ))
                  ],
                ),
                SizedBox(height: 30,),
                RichText(
                  textAlign: TextAlign.start,
                  text: TextSpan(
                      text: Strings.volume.toUpperCase(),
                      style: TextStyle(
                        color: Colors.black87,
                        fontSize: 10,
                        fontWeight: FontWeight.normal,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                            text: "\n\$ ${state.items.volume}",
                            style: TextStyle(
                                color: Colors.black87,
                                fontSize: 18,
                                fontWeight: FontWeight.bold)),
                      ]),
                ),

                Align(
                    alignment: Alignment.centerRight,
                    child: _viewOrderBook()
                ),
                OrderBookPage()
              ],
            ),
          );
        }
        return const Text('');
      },
    );
  }

  Widget _viewOrderBook(){
    return GestureDetector(
      onTap: (){
        _orderBookBloc.add(GetOrderBook(searchString: _textController.text));
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        padding:const EdgeInsets.all(5),
        child: Text(
          Strings.view_order_book.toUpperCase(),
          style: TextStyle(
            color: Colors.deepPurpleAccent,
            fontSize: 14,
            fontFamily: "ProximaNova",
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
