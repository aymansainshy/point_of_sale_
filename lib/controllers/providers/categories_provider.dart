import 'package:flutter/material.dart';
import 'package:pos/models/category.dart';

class CategoriesProvider with ChangeNotifier {
  final List<Category> categories = [];
}
