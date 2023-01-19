class ProductModel {
  final String key;
  final int code;
  final String codebar;
  final String codebarInner;
  final String codebarMaster;
  final String unit;
  final String description;
  final String brand;
  final double buy;
  final double retailsale;
  final double wholesale;
  final int inventory;
  final int minInventory;
  final String department;
  final int id;
  final DateTime lastUpdate;

  ProductModel(
      {required this.key,
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
      required this.lastUpdate});

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        key: json["key"].toString(),
        code: json["code"],
        codebar: json["codebar"],
        codebarInner: json["codebarInner"],
        codebarMaster: json["codebarMaster"],
        unit: json["unit"].toString(),
        description: json["description"].toString(),
        brand: json["brand"].toString(),
        buy: json["buy"],
        retailsale: json["retailsale"],
        wholesale: json["wholesale"],
        inventory: json["inventory"],
        minInventory: json["min_inventory"],
        department: json["department"].toString(),
        id: json["id"],
        lastUpdate: DateTime.parse(json["LastUpdate"].toString()),
      );
}
