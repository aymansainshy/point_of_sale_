import 'package:pos/models/products_model.dart';

class ProductsRepository {
  final List<Products> _products = [
    Products(
      id: 1,
      categoryId: 1,
      name: "Indomie",
      price: 22.98,
      discount: 0.0,
      stock: 12,
      imageUrl: "https://m.media-amazon.com/images/I/911jeys43uL._SL1500_.jpg",
    ),
    Products(
      id: 2,
      categoryId: 1,
      name: "MacBook Pro",
      price: 998.0,
      discount: 35.0,
      stock: 0,
      imageUrl:
          "https://support.apple.com/library/APPLE/APPLECARE_ALLGEOS/SP776/sp776-mbp15touch-space.jpeg",
    ),
    Products(
      id: 3,
      categoryId: 4,
      name: "AirPods Max",
      price: 45.99,
      discount: 0.0,
      stock: 12,
      imageUrl:
          "https://images.macrumors.com/article-new/2020/05/airpods-max-in-blue.jpg",
    ),
    Products(
      id: 4,
      categoryId: 1,
      name: "iphone 12 pro max",
      price: 998.00,
      discount: 0.0,
      stock: 12,
      imageUrl:
          "https://www.ubuy.ke/productimg/?image=aHR0cHM6Ly9pbWFnZXMtbmEuc3NsLWltYWdlcy1hbWF6b24uY29tL2ltYWdlcy9JLzcxYUFxOG4xVGxMLl9TUzQwMF8uanBn.jpg",
    ),
    Products(
      id: 5,
      categoryId: 2,
      name: "battal of water",
      price: 10.0,
      stock: 12,
      discount: 0.0,
      imageUrl:
          "https://images-na.ssl-images-amazon.com/images/I/41IQhpes4RL.jpg",
    ),
    Products(
      id: 6,
      categoryId: 2,
      name: "Fm Radio",
      price: 45.00,
      stock: 12,
      discount: 10.0,
      imageUrl:
          "https://images-na.ssl-images-amazon.com/images/I/91TSzAoi80L._AC_SL1500_.jpg",
    ),
    Products(
      id: 7,
      categoryId: 1,
      stock: 0,
      name: "drawing Penciles",
      discount: 0.0,
      price: 23.99,
      imageUrl:
          "https://cdn.arteza.com/products/20/05/colored-pencils-triangular-48_maDIvj7i_526x526.jpg",
    ),
    Products(
      id: 8,
      categoryId: 1,
      name: "playstation 5",
      discount: 0.0,
      price: 99.00,
      stock: 12,
      imageUrl:
          "https://cdn.shopify.com/s/files/1/0259/1735/products/sony-ps5-console-black-carbon-fibre-skins_fb1afef5-dfcc-43be-8090-bbc669d2a3c6_1500x.jpg?v=1606218677",
    ),
    Products(
      id: 9,
      categoryId: 5,
      name: "fifa 20",
      price: 35.00,
      discount: 5.0,
      stock: 12,
      imageUrl:
          "https://d3j2s6hdd6a7rg.cloudfront.net/v2/uploads/media/default/0001/91/9ce8bbfb2d2057ffe1d88148ed1274de50e0c15d.jpeg",
    ),
    Products(
      id: 10,
      categoryId: 4,
      name: "Gaming Chair",
      price: 22.40,
      discount: 0.0,
      stock: 12,
      imageUrl:
          "https://thermaltake.azureedge.net/pub/media/catalog/product/cache/e4fc6e308b66431a310dcd4dc0838059/x/f/xfit_black-white01.jpg",
    ),
    Products(
      id: 11,
      name: "playstation 5",
      discount: 0.0,
      stock: 12,
      price: 99.00,
      imageUrl:
          "https://cdn.shopify.com/s/files/1/0259/1735/products/sony-ps5-console-black-carbon-fibre-skins_fb1afef5-dfcc-43be-8090-bbc669d2a3c6_1500x.jpg?v=1606218677",
    ),
    Products(
      id: 12,
      categoryId: 1,
      name: "fifa 20",
      price: 35.00,
      discount: 5.0,
      stock: 12,
      imageUrl:
          "https://d3j2s6hdd6a7rg.cloudfront.net/v2/uploads/media/default/0001/91/9ce8bbfb2d2057ffe1d88148ed1274de50e0c15d.jpeg",
    ),
    Products(
      id: 13,
      categoryId: 1,
      name: "Gaming Chair",
      discount: 0.0,
      stock: 12,
      price: 22.40,
      imageUrl:
          "https://thermaltake.azureedge.net/pub/media/catalog/product/cache/e4fc6e308b66431a310dcd4dc0838059/x/f/xfit_black-white01.jpg",
    ),
    Products(
      id: 14,
      categoryId: 2,
      name: "playstation 5",
      discount: 0.0,
      stock: 12,
      price: 99.00,
      imageUrl:
          "https://cdn.shopify.com/s/files/1/0259/1735/products/sony-ps5-console-black-carbon-fibre-skins_fb1afef5-dfcc-43be-8090-bbc669d2a3c6_1500x.jpg?v=1606218677",
    ),
    Products(
      id: 15,
      categoryId: 4,
      name: "fifa 20",
      price: 35.00,
      discount: 5.0,
      stock: 12,
      imageUrl:
          "https://d3j2s6hdd6a7rg.cloudfront.net/v2/uploads/media/default/0001/91/9ce8bbfb2d2057ffe1d88148ed1274de50e0c15d.jpeg",
    ),
    Products(
      id: 16,
      categoryId: 1,
      name: "Gaming Chair",
      discount: 0.0,
      price: 22.40,
      stock: 12,
      imageUrl:
          "https://thermaltake.azureedge.net/pub/media/catalog/product/cache/e4fc6e308b66431a310dcd4dc0838059/x/f/xfit_black-white01.jpg",
    ),
  ];

  Future<List<Products>> fetchProducts(int catId) {
    return Future.delayed(Duration(milliseconds: 300)).then((_) {
      return _products.where((product) => product.categoryId == catId).toList();
    });
  }
}
