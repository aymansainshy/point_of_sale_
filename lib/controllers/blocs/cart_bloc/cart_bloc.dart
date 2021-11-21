import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:pos/models/cart_model.dart';
import 'package:pos/models/products_model.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartState(cartItems: {}));

  @override
  Stream<CartState> mapEventToState(CartEvent event) async* {
    final currentState = state;
    Map<String, Cart> cart = currentState.cartItems;


    if (event is GetCartProducts) {
      yield state.copyWith(cartItems: cart);
    }

    if (event is AddItemWithQuanitity) {
      try {
        if (cart.containsKey(event.product.id)) {
          return;
        } else {
          cart.putIfAbsent(
            event.product.id.toString(),
            () => Cart(
              productTitle: event.product.name,
              productImage: event.product.imageUrl,
              productId: event.product.id.toString(),
              productPrice: event.product.price,
              quantity: event.quantity,
            ),
          );
        }
        yield state.copyWith(cartItems: cart);
      } on DioError catch (e) {
        print("Adding cart Error ... $e");
        cart.remove(event.product.id.toString());
        yield state.copyWith(error: e.toString(), cartItems: cart);
      }
    }

    if (event is AddItemToCart) {
      if (cart.containsKey(event.product.id)) {
        return;
      } else {
        cart.putIfAbsent(
          event.product.id.toString(),
          () => Cart(
            productTitle: event.product.name,
            productImage: event.product.imageUrl,
            productId: event.product.id.toString(),
            productPrice: event.product.price,
            quantity: 1,
          ),
        );
      }
      yield state.copyWith(cartItems: cart);
    }

    if (event is IncreaseItemQuantitiy) {
      if (!cart.containsKey(event.productId.toString())) {
        return;
      }
      cart.update(
        event.productId.toString(),
        (existingProductItem) => Cart(
          productTitle: existingProductItem.productTitle,
          productId: existingProductItem.productId,
          productImage: existingProductItem.productImage,
          productPrice: existingProductItem.productPrice,
          quantity: existingProductItem.quantity + 1,
        ),
      );
      yield state.copyWith(cartItems: cart);
    }

    if (event is DencreaseItemQuantitiy) {
      if (!cart.containsKey(event.productId.toString()) ||
          cart[event.productId.toString()]!.quantity <= 1) {
        return;
      }
      cart.update(
        event.productId.toString(),
        (existingProductItem) => Cart(
          productTitle: existingProductItem.productTitle,
          productId: existingProductItem.productId,
          productImage: existingProductItem.productImage,
          productPrice: existingProductItem.productPrice,
          quantity: existingProductItem.quantity - 1,
        ),
      );
      yield state.copyWith(cartItems: cart);
    }

    if (event is RemoveItem) {
      //   Cart? cartProduct = cart["${event.productId}"];

      cart.remove(event.productId.toString());
      yield state.copyWith(cartItems: cart);
    }

    if (event is ClearCart) {
      cart.clear();
      yield state.copyWith(cartItems: cart);
    }
  }
}
