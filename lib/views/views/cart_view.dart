import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pos/controllers/blocs/cart_bloc/cart_bloc.dart';
import 'package:pos/views/widgets/cart_items.dart';
import 'package:pos/views/widgets/payment_methods.dart';

class CartView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartBloc, CartState>(
      builder: (context, cartState) {
        return Container(
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              // Container(
              //   height: 40,
              //   color: Colors.red,
              // ),
              Expanded(
                child: CartItems(),
              ),
              Container(
                // width: MediaQuery.of(context).size.width,
                height: 150,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "SubTotal",
                          ),
                          Text(
                              "-\$354",
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Discound",
                          ),
                          Text(
                            "-\$354",
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Sales Tax",
                          ),
                          Text(
                            "\$384",
                          ),
                        ],
                      ),
                    ),
                    Divider(
                      color: Colors.grey,
                    ),
                    Padding(
                      padding: EdgeInsets.only( left: 20, right: 20),
                      child: Card(
                        elevation: 3,
                        child: Container(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Total",
                                  style: TextStyle(
                                    fontSize: 18,
                                  ),
                                ),
                                Text(
                                  "${cartState.totalAmount.toStringAsFixed(2)}",
                                  style: TextStyle(
                                    fontSize: 18,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
    
              Padding(
                padding: EdgeInsets.only(left: 20, right: 20),
                child: Card(
                  elevation: 3,
                  child: Container(
                    width: 400,
                    // height: 70,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "CASHLESS CVREADIT",
                              ),
                              Text(
                                "\$9345.345",
                                style: TextStyle(
                                  color: Colors.orange,
                                ),
                              ),
                              Text(
                                "avalable",
                              ),
                            ],
                          ),
                          TextButton(
                            onPressed: () {},
                            child: Text(
                              "Cancel",
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              PaymentMethods(),
              // Padding(
              //   padding: EdgeInsets.only(top: 620, left: 20, right: 20),
              //   child: Card(
              //     elevation: 0.1,
              //     child: Container(
              //       width: double.infinity,
              //       height: 40,
              //       color: Colors.white70,
              //       child: Row(
              //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //         children: [
              //           Padding(
              //             padding: const EdgeInsets.all(8.0),
              //             child: Text(
              //               "Balance Due",
              //             ),
              //           ),
              //           Padding(
              //             padding: const EdgeInsets.all(8.0),
              //             child: Text(
              //               "$4.4",
              //             ),
              //           ),
              //         ],
              //       ),
              //     ),
              //   ),
              // ),
            ],
          ),
        );
      },
    );
  }
}
