// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;
import 'dart:convert';
// import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:marpo_app/models/product.dart';

class ProductAPI {
  final String _url = "http://192.168.1.88:8000/api";

  Future<ProductModel> getProduct(String code) async {
    final url = Uri.parse('$_url/getProduct?search=$code');

    final resp = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
    );
    if (resp.statusCode == 200) {
      if (jsonDecode(resp.body) != null) {
        var p = ProductModel.fromJson(jsonDecode(resp.body));
        return p;
      } else {
        return ProductModel(
            brand: '',
            buy: 0,
            code: 0,
            codebar: '',
            codebarInner: '',
            codebarMaster: '',
            department: '',
            description: '',
            inventory: 0,
            key: '',
            lastUpdate: DateTime.parse(""),
            minInventory: 0,
            retailsale: 0,
            unit: '',
            id: 0,
            wholesale: 0);
      }
    } else {
      return ProductModel(
          brand: '',
          buy: 0,
          code: 0,
          codebar: '',
          codebarInner: '',
          codebarMaster: '',
          department: '',
          description: '',
          inventory: 0,
          key: '',
          lastUpdate: DateTime.parse(""),
          minInventory: 0,
          retailsale: 0,
          unit: '',
          id: 0,
          wholesale: 0);
    }
  }
}
