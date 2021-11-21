import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pos/app_blocs.dart';
import 'package:pos/controllers/blocs/cart_bloc/cart_bloc.dart';

class CartItems extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartBloc, CartState>(
      builder: (context, cartState) {
        return cartState.cartItems.isEmpty
            ? Center(
                child: Text(
                  "Your cart is empty",
                  style: Theme.of(context).textTheme.headline6!.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Colors.grey,
                        fontSize: 15,
                      ),
                ),
              )
            : ListView.builder(
                itemCount: cartState.cartItems.length,
                itemBuilder: (ctx, i) {
                  return Card(
                    elevation: 1,
                    child: ListTile(
                      title: Text(
                          "${cartState.cartItems.values.toList()[i].productTitle}"),
                      subtitle: Text("another text"),
                      leading: Container(
                        height: 30,
                        width: 30,
                        child: Image.network(
                          cartState.cartItems.values.toList()[i].productImage,
                          fit: BoxFit.cover,
                        ),
                      ),
                      trailing: Container(
                        height: 50,
                        width: 200,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            InkWell(
                              onTap: () {
                                AppBlocs.cartBloc.add(RemoveItem(productId: int.parse(cartState.cartItems.values.toList()[i].productId)));
                              },
                              child: Icon(Icons.delete),
                            ),
                            Text("${cartState.cartItems.values.toList()[i].quantity}"),
                            InkWell(
                              onTap: () {
                                AppBlocs.cartBloc.add(IncreaseItemQuantitiy(productId:int.parse(cartState.cartItems.values.toList()[i].productId)));
                              },
                              child: Icon(Icons.add_circle),
                            ),
                            SizedBox(width: 20),
                            Text(
                                "\$ ${(cartState.cartItems.values.toList()[i].productPrice * cartState.cartItems.values.toList()[i].quantity).toStringAsFixed(2)}"),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              );
      },
    );
  }
}
