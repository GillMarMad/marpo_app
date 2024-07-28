import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/pdf_bloc/bloc/pdf_bloc_bloc.dart';

import '../widgets/pdf.dart';

class PDFScreen extends StatelessWidget {
  const PDFScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final String url = ModalRoute.of(context)!.settings.arguments as String;
    return Container(
      color: Theme.of(context).canvasColor,
      child: PDFViewer(
        url: url,
      ),
    );
  }
}
