import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marpo_app/blocs/pdf_bloc/bloc/pdf_bloc_bloc.dart';
import 'package:marpo_app/blocs/search_bloc/bloc/search_product_bloc.dart';
import 'package:marpo_app/screens/screens.dart';
import 'blocs/scan_bloc/scan_code_bloc.dart';

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
          BlocProvider(
            create: (context) => SearchProductBloc(),
          ),
          BlocProvider(
            create: (context) => PDFBloc(),
          ),
        ],
        child: MaterialApp(
          title: 'Marpo App',
          debugShowCheckedModeBanner: false,
          initialRoute: 'home',
          routes: {
            'home': (context) => const SafeArea(child: HomeScreen()),
            'details': (context) => const SafeArea(child: ProductDetails()),
            'pdf': (context) => const SafeArea(child: PDFScreen()),
          },
          theme: ThemeData.dark().copyWith(
            appBarTheme: const AppBarTheme(
              color: Colors.greenAccent,
              elevation: 10,
              iconTheme: IconThemeData(color: Colors.black87),
              titleTextStyle: TextStyle(color: Colors.black87, fontSize: 25),
            ),
          ),
        ));
  }
}
