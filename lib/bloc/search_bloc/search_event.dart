import 'package:equatable/equatable.dart';

abstract class SearchEvent extends Equatable {
  const SearchEvent();
}

class TextSearched extends SearchEvent {
  final String searchString;

  const TextSearched({this.searchString});

  @override
  List<Object> get props => [];

  @override
  String toString() => 'TextChanged { searchString: "", }';
}

