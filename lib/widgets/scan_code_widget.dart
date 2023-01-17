import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

Future<String> scan() async {
  String barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
      "#ff6666", "Cancel", true, ScanMode.BARCODE);
  return barcodeScanRes;
}
