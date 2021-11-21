part of 'cart_bloc.dart';

class CartState {

  final Map<String, Cart> cartItems;
  final String? error;

  CartState({required this.cartItems, this.error});

  int get itemCount {
    return cartItems.length;
  }

  double get totalAmount {
    var total = 0.0;
    // cartItems.forEach((key, product) => total += product.descountAffterOffer(product));
    cartItems.forEach((key, product) => total +=  product.productPrice * product.quantity);
    // product.productPrice * product.quantity);
    return total;
  }

  int singleItemCount(String productId) {
    var cartList = cartItems.values.toList();
    var currentProduct = cartList.firstWhere((product) => product.productId == productId);
    // print(currentProduct.quantity);
    return currentProduct.quantity;
  }

  CartState copyWith({Map<String, Cart>? cartItems, int? customeQuatitiy, String? error}) {
    return CartState(
      cartItems: cartItems ?? this.cartItems,
      error: error ?? this.error,
    );
  }
}
