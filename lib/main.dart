import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marpo_app/pages/pdf.dart';

import 'package:marpo_app/blocs/bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => ScanCodeBloc(),
          ),
        ],
        child: MaterialApp(
          title: 'Marpo App',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(primarySwatch: Colors.orange),
          home: const Home(),
        ));
  }
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.orangeAccent,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Expanded(
          child: Column(
            children: [
              const Text("PDF"),
              const SizedBox(
                height: 300,
                width: double.infinity,
                child: PDFViewer(),
              ),
              ElevatedButton(
                  onPressed: () {
                    BlocProvider.of<ScanCodeBloc>(context, listen: false)
                        .add(ScanEvent());
                  },
                  child: const Text("Scan")),
              BlocBuilder<ScanCodeBloc, ScanCodeState>(
                builder: (context, state) {
                  return Container(
                    color: Colors.amber,
                    child: Text(state.code ?? ""),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
