import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marpo_app/blocs/bloc.dart';
import 'package:marpo_app/helpers/debouncer.dart';
import 'package:marpo_app/search/search_item.dart';

class ProducrSerachDelegate extends SearchDelegate {
  final debouncer = Debouncer(duration: const Duration(milliseconds: 500));
  @override
  String? get searchFieldLabel => "Buscar";

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () => query = '', icon: const Icon(Icons.clear_rounded))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () => close(context, null),
        icon: const Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    return BlocBuilder<SearchProductBloc, SearchProductState>(
      builder: (context, state) {
        if (state.products == null) {
          return const Center(child: CircularProgressIndicator());
        }
        return ListView.builder(
            itemCount: state.products!.length,
            itemBuilder: ((context, index) => SearchItem(
                  product: state.products![index],
                  urlImage: state.products![index].fullMainImg,
                )));
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if (query.length < 3) {
      return const Center(
          child: Icon(
        Icons.gps_fixed,
        color: Colors.black38,
        size: 200,
      ));
    }
    delay(context, query);
    return BlocBuilder<SearchProductBloc, SearchProductState>(
      builder: (context, state) {
        if (state.products == null) {
          return const Center(child: CircularProgressIndicator());
        }
        return ListView.builder(
            itemCount: state.products!.length,
            itemBuilder: ((context, index) => SearchItem(
                  product: state.products![index],
                  urlImage: state.products![index].fullMainImg,
                )));
      },
    );
  }

  void delay(context, word) {
    debouncer.onValue = (value) {
      if (value.toString().length > 2) {
        BlocProvider.of<SearchProductBloc>(context, listen: false)
            .add(SearchProductsEvent(query));
      }
    };
    final timer = Timer.periodic(const Duration(milliseconds: 300), (_) {
      debouncer.value = word;
    });
    Future.delayed(const Duration(milliseconds: 301))
        .then((value) => timer.cancel());
  }
}
