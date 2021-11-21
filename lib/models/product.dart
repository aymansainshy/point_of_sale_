final String productsTable = 'products';

class ProductsFields {
  static final String id = "_id";
  static final String name = "name";
  static final String qty = "qty";
  static final String price = "price";
  static final String createdAt = "createdAt";
  static final List<String> values = [id, name, qty, price, createdAt];
}

class Product {
 
  final int? id;
  final String name;
  final int qty;
  final int price;
  final DateTime createdAt;

  Product({
    
    this.id,
    required this.name,
    required this.qty,
    required this.price,
    required this.createdAt,
  });

  Product copy({
    int? id,
    String? name,
    int? qty,
    int? price,
    DateTime? createdAt,
  }) =>
      Product(
        id: id ?? this.id,
        name: name ?? this.name,
        qty: qty ?? this.qty,
        price: price ?? this.price,
        createdAt: createdAt ?? this.createdAt,
      );

  static Product fromJson(Map<String, Object?> json) => Product(
        id: json[ProductsFields.id] as int?,
        name: json[ProductsFields.name] as String,
        qty: json[ProductsFields.qty] as int,
        price: json[ProductsFields.price] as int,
        createdAt: DateTime.parse(json[ProductsFields.createdAt] as String),
      );

  Map<String, Object?> toJson() => {
        ProductsFields.id: id,
        ProductsFields.name: name,
        ProductsFields.qty: qty,
        ProductsFields.price: price,
        ProductsFields.createdAt: createdAt.toIso8601String(),
      };
}
