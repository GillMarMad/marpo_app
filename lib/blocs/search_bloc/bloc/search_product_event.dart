part of 'search_product_bloc.dart';

abstract class SearchProductEvent {}

class SearchProductsInitialEvent extends SearchProductEvent {
  SearchProductsInitialEvent();
}

class SearchProductsEvent extends SearchProductEvent {
  final String word;
  SearchProductsEvent(this.word);
}
