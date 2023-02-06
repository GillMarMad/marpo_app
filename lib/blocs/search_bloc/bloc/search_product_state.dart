part of 'search_product_bloc.dart';

abstract class SearchProductState extends Equatable {
  final List<ProductModel>? products;
  final List<ProductModel>? newProducts;
  const SearchProductState(this.products, this.newProducts);

  @override
  List<Object> get props => [];
}

class SearchProductInitialState extends SearchProductState {
  const SearchProductInitialState(super.products, super.newProducts);
}

class SearchPruductActionState extends SearchProductState {
  const SearchPruductActionState(super.products, super.newProducts);
}
