import 'package:flutter/material.dart';
import 'package:pdfx/pdfx.dart';
import 'package:internet_file/internet_file.dart';

import '../api/product.dart';

class PDFViewer extends StatefulWidget {
  const PDFViewer({super.key, required this.url});
  final String url;

  @override
  State<PDFViewer> createState() => _PDFViewerState();
}

class _PDFViewerState extends State<PDFViewer> {
  late PdfControllerPinch _pdfControllerPinch;
  final pdf = PDFApi();

  _PDFViewerState();
  @override
  void initState() {
    _pdfControllerPinch = PdfControllerPinch(
      // document: PdfDocument.openAsset('assets/hello.pdf'),
      document: PdfDocument.openData(
        InternetFile.get(widget.url),
      ),
      initialPage: 0,
    );
    super.initState();
  }

  @override
  void dispose() {
    _pdfControllerPinch.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PdfViewPinch(
      builders: PdfViewPinchBuilders<DefaultBuilderOptions>(
        options: const DefaultBuilderOptions(),
        documentLoaderBuilder: (_) =>
            const Center(child: CircularProgressIndicator()),
        pageLoaderBuilder: (_) =>
            const Center(child: CircularProgressIndicator()),
        errorBuilder: (_, error) => Center(
            child: ElevatedButton(
                onPressed: () => Navigator.pop(context),
                child: const Text("Regresar al producto"))),
      ),
      controller: _pdfControllerPinch,
    );
  }
}
