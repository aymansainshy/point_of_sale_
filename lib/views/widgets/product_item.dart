import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pos/app_blocs.dart';
import 'package:pos/controllers/blocs/cart_bloc/cart_bloc.dart';

import 'package:pos/models/products_model.dart';

class ProductItem extends StatelessWidget {
  final Products product;

  const ProductItem({Key? key, required this.product}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 5, right: 5),
      child: Stack(
        clipBehavior: Clip.none,
        alignment: AlignmentDirectional.topCenter,
        children: [
          Container(
            padding: const EdgeInsets.all(7),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(5)),
            ),
            // height: 210,
            width: 200,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Transform.translate(
                      offset: Offset(0, 3),
                      child: Container(
                        height: 20,
                        width: 30,
                        padding: EdgeInsets.all(2),
                        decoration: BoxDecoration(
                          color: Theme.of(context).canvasColor,
                          borderRadius: BorderRadius.all(Radius.circular(4)),
                        ),
                        alignment: Alignment.center,
                        child: FittedBox(
                          child: Text(
                            "Kilo",
                            style:
                                Theme.of(context).textTheme.bodyText2!.copyWith(
                                      fontSize: 12,
                                    ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 5),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: Image.network(product.imageUrl),
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  product.name,
                  style: Theme.of(context).textTheme.bodyText2!.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Colors.grey,
                        fontSize: 15,
                      ),
                ),
                if (product.discount == 0.0)
                  RichText(
                    text: TextSpan(
                      text: "${product.price.toStringAsFixed(2)}",
                      style: Theme.of(context).textTheme.bodyText2!.copyWith(
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                            fontSize: 14,
                          ),
                      children: <TextSpan>[
                        TextSpan(
                          text: 'SDN',
                          style: Theme.of(context)
                              .textTheme
                              .bodyText2!
                              .copyWith(fontSize: 12, color: Colors.redAccent),
                        ),
                      ],
                    ),
                  ),
                if (product.discount > 0.0)
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      RichText(
                        text: TextSpan(
                          children: <TextSpan>[
                            TextSpan(
                              text: " ${product.price.toStringAsFixed(2)}",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText2!
                                  .copyWith(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.green[500],
                                      fontSize: 14),
                            ),
                            TextSpan(
                              text: 'SDN ',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText2!
                                  .copyWith(
                                      fontSize: 12, color: Colors.redAccent),
                            ),
                          ],
                        ),
                      ),
                      Transform.rotate(
                        angle: 3.14 / 45.0,
                        child: Container(
                          width: 80,
                          height: 1,
                          color: Colors.redAccent,
                        ),
                      ),
                    ],
                  ),
                if (product.discount > 0.0)
                  RichText(
                    text: TextSpan(
                      children: <TextSpan>[
                        TextSpan(
                          text: " 223",
                          style:
                              Theme.of(context).textTheme.bodyText2!.copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black87,
                                    fontSize: 14,
                                  ),
                        ),
                        TextSpan(
                          text: 'SDN',
                          style: Theme.of(context)
                              .textTheme
                              .bodyText2!
                              .copyWith(fontSize: 12, color: Colors.redAccent),
                        ),
                      ],
                    ),
                  ),
                SizedBox(height: 5),
                if (product.stock <= 0)
                  Container(
                    height: 35,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: const BorderRadius.all(Radius.circular(4)),
                    ),
                    alignment: Alignment.center,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Out of Stock",
                          style:
                              Theme.of(context).textTheme.bodyText1!.copyWith(
                                    color: Colors.white,
                                    fontSize: 13,
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                        SizedBox(width: 5),
                        Icon(
                          Icons.error,
                          color: Colors.white,
                          size: 14,
                        ),
                      ],
                    ),
                  ),
                if (product.stock > 0)
                  BlocBuilder<CartBloc, CartState>(
                    builder: (context, cartState) {
                      if (!cartState.cartItems
                              .containsKey(product.id.toString()) ||
                          cartState.cartItems.isEmpty) {
                        return GestureDetector(
                          onTap: () {
                            AppBlocs.cartBloc
                                .add(AddItemToCart(product: product));
                          },
                          child: Container(
                            height: 35,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Theme.of(context).accentColor,
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(3)),
                            ),
                            alignment: Alignment.center,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  "Add to Cart",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText1!
                                      .copyWith(
                                        color: Colors.white,
                                        fontSize: 13,
                                        fontWeight: FontWeight.bold,
                                      ),
                                ),
                                SizedBox(width: 5),
                                Icon(
                                  Icons.add_shopping_cart_rounded,
                                  color: Colors.white,
                                  size: 14,
                                ),
                              ],
                            ),
                          ),
                        );
                      }
                      if (cartState.cartItems
                          .containsKey(product.id.toString())) {
                        return Container(
                          height: 35,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: Theme.of(context).primaryColor,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(4)),
                              border: Border.all(
                                color: Theme.of(context).accentColor,
                                width: 1.5,
                              )),
                          // alignment: Alignment.center,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(
                                child: GestureDetector(
                                  onTap: () {
                                    AppBlocs.cartBloc.add(IncreaseItemQuantitiy(productId: product.id));
                                  },
                                  child: Container(
                                    color: Theme.of(context).primaryColor,
                                    child: Icon(
                                      Icons.add,
                                      color: Colors.white,
                                      size: 20,
                                    ),
                                  ),
                                ),
                              ),
                              VerticalDivider(
                                 color:Colors.white30,
                                thickness: 1,
                              ),
                              Expanded(
                                child: Center(
                                  child:  Text(
                                      "${cartState.singleItemCount(product.id.toString())}",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText2!
                                          .copyWith(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14,
                                          ),
                                    ),
                                  
                                ),
                              ),
                              VerticalDivider(
                                color:Colors.white30,
                                thickness: 1,
                              ),
                              Expanded(
                                child: GestureDetector(
                                  onTap: () {
                                    var singleItemCount = cartState.singleItemCount(product.id.toString());
                                    if (singleItemCount <= 1) {
                                      AppBlocs.cartBloc.add( RemoveItem(productId: product.id));
                                    }
                                    AppBlocs.cartBloc.add(DencreaseItemQuantitiy(productId: product.id));
                                  },
                                  child: Container(
                                    color: Theme.of(context).primaryColor,
                                    child: Icon(
                                      Icons.remove,
                                      color:Colors.white,
                                      size: 20,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      }
                      return Container();
                    },
                  ),
              ],
            ),
          ),
          // if (product.discount > 0.0)
          //   Banner(
          //     // child: Text("30 %"),
          //     message: "25 % ",
          //     color: Colors.red[500],
          //     location: BannerLocation.topStart,
          //   ),
          if (product.discount > 0.0)
            Container(
              height: 30,
              width: 20,
              padding: EdgeInsets.all(2),
              decoration: BoxDecoration(
                color: Colors.red[500],
                // borderRadius: BorderRadius.all(Radius.circular(4)),
              ),
              alignment: Alignment.center,
              child: Transform.translate(
                offset: Offset(0, 0),
                child: RotatedBox(
                  quarterTurns: -45,
                  child: FittedBox(
                    child: Text(
                      "${product.discount.toStringAsFixed(0)} %",
                      style: Theme.of(context).textTheme.bodyText2!.copyWith(
                            color: Colors.white,
                            fontSize: 12,
                          ),
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
