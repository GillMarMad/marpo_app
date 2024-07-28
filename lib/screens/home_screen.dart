import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marpo_app/blocs/bloc.dart';
import 'package:marpo_app/search/search_delegate.dart';
import 'package:marpo_app/widgets/card_swiper.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<SearchProductBloc>(context, listen: false)
        .add(SearchProductsInitialEvent());
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Marpo App",
        ),
        actions: [
          IconButton(
              onPressed: () => showSearch(
                  context: context, delegate: ProducrSerachDelegate()),
              icon: const Icon(Icons.search_outlined)),
          IconButton(
              onPressed: () =>
                  BlocProvider.of<ScanCodeBloc>(context, listen: false)
                      .add(ScanEvent()),
              icon: const Icon(Icons.document_scanner_outlined))
        ],
      ),
      body: BlocListener<ScanCodeBloc, ScanCodeState>(
        listener: (context, state) {
          if (state is ScanCodeDoneState &&
              state.code != null &&
              state.poduct != null) {
            Navigator.pushNamed(context, 'details', arguments: state.poduct);
          }
        },
        child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: BlocBuilder<SearchProductBloc, SearchProductState>(
              builder: (context, state) {
                if (state.newProducts == null) {
                  return const Center(child: CircularProgressIndicator());
                }
                return Column(
                    children: [CardSwiper(products: state.newProducts!)]);
              },
            )),
      ),
    );
  }
}
