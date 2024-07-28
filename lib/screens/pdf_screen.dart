import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class PDFScreen extends StatelessWidget {
  const PDFScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final String url = ModalRoute.of(context)!.settings.arguments as String;
    return Container(
      color: Theme.of(context).canvasColor,
      child: SfPdfViewer.network(url),
      // PDFViewer(
      //   url: url,
      // ),
    );
  }
}
