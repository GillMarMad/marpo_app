import 'package:flutter/material.dart';
import 'package:pdfx/pdfx.dart';
import 'package:internet_file/internet_file.dart';

class PDFViewer extends StatefulWidget {
  const PDFViewer({super.key, required this.id});
  final String id;

  @override
  // ignore: no_logic_in_create_state
  State<PDFViewer> createState() => _PDFViewerState(id);
}

class _PDFViewerState extends State<PDFViewer> {
  final String id;
  late PdfControllerPinch _pdfControllerPinch;

  _PDFViewerState(this.id);
  @override
  void initState() {
    _pdfControllerPinch = PdfControllerPinch(
      // document: PdfDocument.openAsset('assets/hello.pdf'),
      document: PdfDocument.openData(
        InternetFile.get(
          'https://www.truper.com/ficha_tecnica/views/ficha-print.php?id=$id',
        ),
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
        errorBuilder: (_, error) => Center(child: Text(error.toString())),
      ),
      controller: _pdfControllerPinch,
    );
  }
}
