import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pos/app_blocs.dart';
import 'package:pos/controllers/blocs/products_bloc/products_bloc.dart';
import 'package:pos/models/category.dart';
import 'package:pos/views/widgets/product_item.dart';

class ProductsView extends StatefulWidget {
  late final List<Category> categories;

  ProductsView({required this.categories});
  @override
  State<ProductsView> createState() => _ProductsViewState();
}

class _ProductsViewState extends State<ProductsView> {
  @override
  void initState() {
    super.initState();
    // AppBlocs.categoriesBloc.add(FetchCategories());
    AppBlocs.productsBloc.add(FetchProducts(supCatId: widget.categories.first.id));
  }

  int selectedValue = 1;

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;

    return DefaultTabController(
        length: widget.categories.length,
        child: Container(
          width: mediaQuery.width * 0.70,
          child: Column(
            children: [
              Container(
                width: mediaQuery.width * 0.70,
                child: TabBar(
                  isScrollable: true,
                  indicatorWeight: 3.0,
                  labelColor: Colors.black,
                  onTap: (value) {
                    selectedValue = value;
                    AppBlocs.productsBloc.add(
                        FetchProducts(supCatId: widget.categories[value].id));
                  },
                  tabs: widget.categories
                      .map(
                        (cat) => Tab(text: '${cat.title}'),
                      )
                      .toList(),
                ),
              ),
              Expanded(
                child: widget.categories.isEmpty
                    ? Center(
                        child: Container(
                          height: 400,
                          width: 200,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Center(
                                child: Text(
                                  "NO Products for this category",
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ////
                    /// To check if their is supCategory to fetch product ...................
                    ////

                    : BlocBuilder<ProductsBloc, ProductsState>(
                        builder: (context, productState) {
                        if (productState is ProductsInProgress) {
                          return Center(child: CircularProgressIndicator());
                        }

                        if (productState is ProductsInFaliure) {
                          return Center(
                            child: Container(
                              height: 200,
                              child: Center(
                                child: GestureDetector(
                                  onTap: () {
                                    AppBlocs.productsBloc.add(
                                      FetchProducts(
                                          supCatId: widget
                                              .categories[selectedValue].id),
                                    );
                                  },
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text("Something went Wrong , try again"),
                                      Icon(
                                        Icons.loop_sharp,
                                        color: Theme.of(context).accentColor,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        }

                        if (productState is ProductsLoadedSuccess) {
                          if (productState.products.isEmpty) {
                            return Center(
                              child: Container(
                                height: 200,
                                width: 150,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Center(
                                      child: Text(
                                        "Sorry no items",
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          }

                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: GridView.builder(
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 4,
                                childAspectRatio: 0.73,
                                crossAxisSpacing: 0,
                                mainAxisSpacing: 13,
                              ),
                              itemCount: productState.products.length,
                              itemBuilder: (context, i) => ProductItem(
                                product: productState.products[i],
                              ),
                            ),
                          );
                        }

                        return Container();
                      }),
              ),
            ],
          ),
        ));
  }
}
