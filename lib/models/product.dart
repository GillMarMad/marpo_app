import 'dart:convert';

List<ProductModel> productModelFromJson(String str) => List<ProductModel>.from(
    json.decode(str).map((x) => ProductModel.fromJson(x)));

String productModelToJson(List<ProductModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ProductModel {
  ProductModel({
    required this.key,
    required this.code,
    required this.codebar,
    required this.codebarInner,
    required this.codebarMaster,
    required this.unit,
    required this.description,
    required this.brand,
    required this.buy,
    required this.retailsale,
    required this.wholesale,
    required this.inventory,
    required this.minInventory,
    required this.department,
    required this.id,
    required this.box,
    required this.master,
    required this.lastUpdate,
  });

  String key;
  String code;
  String codebar;
  String codebarInner;
  String codebarMaster;
  String unit;
  String description;
  String brand;
  double buy;
  double retailsale;
  double wholesale;
  int inventory;
  int minInventory;
  String department;
  int id;
  int box;
  int master;
  DateTime lastUpdate;

  get fullMainImg {
    return "http://192.168.1.85:8000/api/image/${code.replaceAll('/', '')}";
  }

  get fullBrandImg {
    return "http://192.168.1.85:8000/api/image/brand/${brand.toLowerCase()}";
  }

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        key: json["key"],
        code: json["code"],
        codebar: json["codebar"],
        codebarInner: json["codebarInner"],
        codebarMaster: json["codebarMaster"],
        unit: json["unit"],
        description: json["description"],
        brand: json["brand"],
        buy: json["buy"]?.toDouble(),
        retailsale: json["retailsale"]?.toDouble(),
        wholesale: json["wholesale"]?.toDouble(),
        inventory: json["inventory"],
        minInventory: json["min_inventory"],
        department: json["department"],
        id: json["id"],
        box: json["box"],
        master: json["master"],
        lastUpdate: DateTime.parse(json["lastUpdate"]),
      );

  Map<String, dynamic> toJson() => {
        "key": key,
        "code": code,
        "codebar": codebar,
        "codebarInner": codebarInner,
        "codebarMaster": codebarMaster,
        "unit": unit,
        "description": description,
        "brand": brand,
        "buy": buy,
        "retailsale": retailsale,
        "wholesale": wholesale,
        "inventory": inventory,
        "min_inventory": minInventory,
        "department": department,
        "id": id,
        "box": box,
        "master": master,
        "LastUpdate": lastUpdate.toIso8601String(),
      };
}
