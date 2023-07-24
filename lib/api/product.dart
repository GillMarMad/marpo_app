// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;
import 'dart:convert';
// import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:marpo_app/models/product.dart';

class ProductAPI {
  final String _url = "http://192.168.1.86:8000/api";

  Future<ProductModel> getProduct(String code) async {
    final url = Uri.parse('$_url/getProduct?search=$code');

    final resp = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
    );
    if (resp.statusCode == 200) {
      if (jsonDecode(resp.body) != null) {
        var p = ProductModel.fromJson(jsonDecode(utf8.decode(resp.bodyBytes)));
        return p;
      } else {
        return ProductModel(
            brand: '',
            buy: 0,
            code: '',
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
            box: 0,
            master: 0,
            wholesale: 0);
      }
    } else {
      return ProductModel(
          brand: '',
          buy: 0,
          code: '',
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
          box: 0,
          master: 0,
          wholesale: 0);
    }
  }
}

class ProductsSearch {
  final String _url = "http://192.168.1.86:8000/api";

  Future<List<ProductModel>> getProducts(String word) async {
    final url = Uri.parse('$_url/searchProduct?search=$word');

    final res = await http.get(
      url,
      headers: {'Content-Type': 'application/json'},
    );
    if (res.statusCode == 200) {
      if (jsonDecode(res.body) != null) {
        var p = productModelFromJson(utf8.decode(res.bodyBytes));
        return p;
      } else {
        return [];
      }
    } else {
      return [];
    }
  }

  Future<List<ProductModel>> getNewProducts() async {
    final url = Uri.parse('$_url/lastUpdatedProducts');

    final res = await http.get(
      url,
      headers: {'Content-Type': 'application/json'},
    );
    if (res.statusCode == 200) {
      if (jsonDecode(res.body) != null) {
        var p = productModelFromJson(utf8.decode(res.bodyBytes));
        return p;
      } else {
        return [];
      }
    } else {
      return [];
    }
  }
}

class PDFApi {
  final String _url = "http://192.168.1.86:8000/api";
  Future<String> getPDFUrl(String code) async {
    final url = Uri.parse("http://192.168.1.86:8000/api/getPDF?code=$code");
    final res = await http.get(
      url,
      headers: {'Content-Type': 'application/json'},
    );
    if (res.statusCode == 200) {
      if (jsonDecode(res.body) != null) {
        var p = utf8.decode(res.bodyBytes);
        return p;
      } else {
        return "";
      }
    } else {
      return "";
    }
  }
}
