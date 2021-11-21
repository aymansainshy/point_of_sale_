import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pos/controllers/blocs/cart_bloc/cart_bloc.dart';

import 'controllers/blocs/categories_bloc/categories_bloc.dart';
import 'controllers/blocs/products_bloc/products_bloc.dart';
import 'repositories/categories_repository.dart';
import 'repositories/products_repository.dart';

class AppBlocs {
  ///////////// [Repositories] .......
  static final categoriesRepositoy = CategoriesRepository();
  static final productsRepositoy = ProductsRepository();
  


  ///////////////// [Blocs].......
  static final productsBloc = ProductsBloc(productsRepositoy);
  static final categoriesBloc = CategoriesBloc(categoriesRepositoy);
  static final cartBloc = CartBloc();



  /////////// [BlocsProvider] ........
  static final List<BlocProvider> providers = [
    BlocProvider<ProductsBloc>(
      create: (context) => productsBloc,
    ),
    BlocProvider<CategoriesBloc>(
      create: (context) => categoriesBloc,
    ),
    BlocProvider<CartBloc>(
      create: (context) => cartBloc,
    ),
  ];



  static void dispose() {
    productsBloc.close();
    categoriesBloc.close();
    cartBloc.close();
  }

  ///Singleton factory
  static final AppBlocs _instance = AppBlocs._internal();

  factory AppBlocs() {
    return _instance;
  }

  AppBlocs._internal();
}
