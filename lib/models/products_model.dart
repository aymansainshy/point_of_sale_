// import 'package:flutter/cupertino.dart';

class Products {
  late int? categoryId;
  final int id;
  final String name;
  final String imageUrl;
  final double price;
  late double discount;
  late int stock;
  int qty;

  Products({
    this.categoryId,
    required this.id,
    required this.name,
    required this.discount,
    required this.imageUrl,
    required this.price,
    required this.stock,
    this.qty = 1,
  });
}
