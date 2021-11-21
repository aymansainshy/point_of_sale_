import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pos/controllers/blocs/categories_bloc/categories_bloc.dart';
import 'package:pos/views/views/products_view.dart';
import 'package:pos/views/views/cart_view.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.white38.withOpacity(0.1),
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "POS",
              style: TextStyle(color: Colors.black),
            ),
            Text(
              "Current Order",
              style: TextStyle(color: Colors.black),
            ),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: TextButton(
              onPressed: () {},
              child: Text(
                "Clear",
                style: TextStyle(),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: TextButton(
              onPressed: () {
                // Navigator.of(context).push()
              },
              child: Icon(
                Icons.settings,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
      body: BlocBuilder<CategoriesBloc, CategoriesState>(
        builder: (context, catState) {
          if (catState is CategoriesSuccess) {
            return Container(
              height: mediaQuery.height,
              width: mediaQuery.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ProductsView(categories: catState.categories),
                  Expanded(child: CartView()),
                ],
              ),
            );
          }
          return Container();
        },
      ),
    );
  }
}
