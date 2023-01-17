import 'package:flutter/material.dart';
import 'package:pdfx/pdfx.dart';
import 'package:internet_file/internet_file.dart';

class PDFViewer extends StatefulWidget {
  const PDFViewer({super.key});

  @override
  State<PDFViewer> createState() => _PDFViewerState();
}

class _PDFViewerState extends State<PDFViewer> {
  final _pdfPinchController = PdfControllerPinch(
      document: PdfDocument.openData(InternetFile.get(
          'https://www.truper.com/ficha_tecnica/views/ficha-print.php?id=197')));
  @override
  Widget build(BuildContext context) {
    return PdfViewPinch(
      builders: PdfViewPinchBuilders<DefaultBuilderOptions>(
        options: const DefaultBuilderOptions(),
        documentLoaderBuilder: (_) =>
            const Center(child: CircularProgressIndicator()),
        pageLoaderBuilder: (_) =>
            const Center(child: CircularProgressIndicator()),
        errorBuilder: (_, error) => Center(child: Text(error.toString())),
      ),
      controller: _pdfPinchController,
    );
  }
}
