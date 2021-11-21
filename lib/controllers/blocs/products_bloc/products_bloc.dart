import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pos/models/products_model.dart';
import 'package:pos/repositories/products_repository.dart';

part 'products_event.dart';
part 'products_state.dart';

class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  ProductsBloc(this.productsRepository) : super(ProductsInitial());

  final ProductsRepository productsRepository;

  // int page = 1;
  List<Products> products = [];

  @override
  Stream<ProductsState> mapEventToState(ProductsEvent event) async* {
  
    if (event is FetchProducts){
      try {
        yield ProductsInProgress();
        products = await productsRepository.fetchProducts(event.supCatId);
        yield ProductsLoadedSuccess(products: products);
      } catch (e) {
        yield ProductsInFaliure(e.toString());
      }
    }
 
  }
}
