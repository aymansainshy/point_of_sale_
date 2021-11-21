part of 'cart_bloc.dart';

abstract class CartEvent extends Equatable {
  const CartEvent();

  @override
  List<Object> get props => [];
}

class AddItemToCart extends CartEvent {
  final Products product;

  AddItemToCart({required this.product});
}

class GetCartProducts extends CartEvent {}

class IncreaseItemQuantitiy extends CartEvent {
  final int productId;

  IncreaseItemQuantitiy({required this.productId});
}

class IncreaseItemQuantitiyWithoutAdding extends CartEvent {
  final int quantitiy;

  IncreaseItemQuantitiyWithoutAdding({required this.quantitiy});
}

class DecreaseItemQuantitiyWithoutAdding extends CartEvent {
  final int quantitiy;

  DecreaseItemQuantitiyWithoutAdding({required this.quantitiy});
}

class AddItemWithQuanitity extends CartEvent {
  final Products product;
  final int quantity;

  AddItemWithQuanitity({required this.product, required this.quantity});
}

class DencreaseItemQuantitiy extends CartEvent {
  final int productId;

  DencreaseItemQuantitiy({required this.productId});
}

class RemoveItem extends CartEvent {
  final int productId;

  RemoveItem({required this.productId});
}

class ClearCart extends CartEvent {}
