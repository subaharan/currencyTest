import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter_currency/data/api.dart';
import 'package:flutter_currency/model/ticker_data.dart';
import 'package:rxdart/rxdart.dart';

import 'search_event.dart';
import 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {

  SearchBloc() : super(SearchStateEmpty());

  @override
  Stream<Transition<SearchEvent, SearchState>> transformEvents(
    Stream<SearchEvent> events,
    Stream<Transition<SearchEvent, SearchState>> Function(
      SearchEvent event,
    )
        transitionFn,
  ) {
    return events
        .debounceTime(const Duration(milliseconds: 300))
        .switchMap(transitionFn);
  }

  @override
  Stream<SearchState> mapEventToState(SearchEvent event) async* {

    if (event is TextSearched) {

        yield SearchStateLoading();
        try {

          var response = await API.getCurrencyData(event.searchString);
          var mapResponse = json.decode(response.body);
          Ticker_data ticker_data = Ticker_data.fromJson(mapResponse);
          yield SearchStateSuccess(ticker_data);

        } catch (error) {
          SearchStateError('something went wrong');
        }

    }
  }
}
