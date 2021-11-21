class Cart {
  final String productId;
  final String productTitle;
  final int quantity;
  final double productPrice;
  // late double? productDiscount;
  final String productImage;

  Cart({
    required this.productId,
    required this.productPrice,
    required this.productImage,
    required this.quantity,
    // this.productDiscount,
    required this.productTitle,
  });

  // double descountAffterOffer(Cart product){

  //   var totalPrice = product.productPrice * product.quantity;

  //   if(product.offer == null){
  //     return totalPrice;
  //   }

  //                    // if free ....
  //   if(product.offer.discount == 0 || product.offer.discount == 100){
  //     if(quantity >= product.offer.buy + product.offer.offerGet) {
  //       totalPrice = product.productPrice * (quantity - product.offer.offerGet);
  //     }

  //     if(quantity == product.offer.buy + product.offer.offerGet - 1){
  //       totalPrice = product.productPrice * (quantity - (product.offer.offerGet - 1));
  //     }

  //   }

  //                    // if there is discount ...
  //   if(product.offer.discount > 0 && product.offer.discount < 100){
  //     if(quantity >= product.offer.buy + product.offer.offerGet) {
  //       var discountInDouble = product.productPrice * product.offer.discount / 100;
  //       var discountAfterProduct = discountInDouble * product.offer.offerGet;

  //       totalPrice = totalPrice  - discountAfterProduct;
  //     }

  //     if(quantity == product.offer.buy + product.offer.offerGet - 1){
  //       var discountInDouble = product.productPrice * product.offer.discount / 100;
  //       var discountAfterProduct = discountInDouble * (product.offer.offerGet - 1);

  //       totalPrice = totalPrice  - discountAfterProduct;
  //     }
  //   }

  //  return totalPrice;
  // }
}

double priceAfterDiscount(double discount, double price) {
  double totalPrice;
  if (discount <= 0) {
    return price;
  } else {
    totalPrice = price - (price * discount / 100);
  }
  return totalPrice;
}
