import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_currency/bloc/orderbook_bloc/orderbook_bloc.dart';


import 'bloc/search_bloc/search_bloc.dart';
import 'views/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.deepPurple,

        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MultiBlocProvider(
        providers: [
          BlocProvider<SearchBloc>(
            create: (_) => SearchBloc(),
          ),
          BlocProvider<OrderBookBloc>(
            create: (_) => OrderBookBloc(),
          ),
        ],
        child: MyHomePage(),
      ),
    );
  }
}


