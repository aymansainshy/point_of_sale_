import 'package:pos/models/category.dart';

class CategoriesRepository {


  List<Category> _cateogries = [
    Category(id: 1, title: 'cat1'),
    Category(id: 2, title: 'cat2'),
    Category(id: 3, title: 'cat3'),
    Category(id: 4, title: 'cat4'),
    Category(id: 5, title: 'cat5'),
    Category(id: 6, title: 'cat6'),
    Category(id: 7, title: 'cat7'),
    Category(id: 8, title: 'cat8'),
    Category(id: 9, title: 'cat9'),
  ];


  List<Category> fetchCategories() {
    return _cateogries;
  }
}
