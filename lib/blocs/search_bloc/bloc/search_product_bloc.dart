import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../api/product.dart';
import '../../../models/product.dart';

part 'search_product_event.dart';
part 'search_product_state.dart';

class SearchProductBloc extends Bloc<SearchProductEvent, SearchProductState> {
  // ignore: prefer_const_constructors
  SearchProductBloc() : super(SearchProductInitialState(null, null)) {
    on<SearchProductsInitialEvent>(_onSearchProductsInitial);
    on<SearchProductsEvent>(_onSearchProductsEvent);
  }

  final search = ProductsSearch();

  void _onSearchProductsEvent(
      SearchProductsEvent event, Emitter<SearchProductState> emit) async {
    emit(SearchProductInitialState(state.products, state.newProducts));
    if (event.word.isEmpty || event.word.length < 3) return;
    final result = await search.getProducts(event.word);
    emit(SearchPruductActionState(result, state.newProducts));
  }

  void _onSearchProductsInitial(SearchProductsInitialEvent event,
      Emitter<SearchProductState> emit) async {
    final result = await search.getNewProducts();
    emit(SearchProductInitialState(state.products, result));
  }
}
