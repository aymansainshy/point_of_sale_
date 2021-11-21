part of 'products_bloc.dart';

abstract class ProductsState extends Equatable {
  const ProductsState();
  
  @override
  List<Object> get props => [];
}

class ProductsInitial extends ProductsState {}

class ProductsInProgress extends ProductsState {}

class ProductsLoadedSuccess extends ProductsState {
  final List<Products> products;


  ProductsLoadedSuccess({required this.products});

  ProductsLoadedSuccess copyWith({List<Products>? products}) {
    return ProductsLoadedSuccess(
      products: products ?? this.products,
    );
  }

  @override
  List<Object> get props => [products];
}
class ProductsInFaliure extends ProductsState {
  final String error;

  ProductsInFaliure(this.error);

}