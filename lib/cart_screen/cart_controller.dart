import 'package:get/get.dart';

import '../utils/utils.dart';

class CartController extends GetxController {
  RxList<dynamic> cartProductList = RxList([]);
  RxDouble totalPrice = 0.0.obs;

  void addToCart({required dynamic product}) {
    if (productInCart(product: product) != true) {
      product['qty'] = 1;
      cartProductList.add(product);
      calculateTotalPrice();
      Utils.showToastMessage(message: "Product added in your cart");
    } else {
      Utils.showToastMessage(message: "Product Already in Cart");
    }
  }

  void updateQuantity({required dynamic product, bool isAdd = true}) {
    int index = cartProductList
        .indexWhere((element) => element['_id'] == product['_id']);
    int newQuantity;
    if (index != -1) {
      if (isAdd) {
        newQuantity = cartProductList[index]['qty'] + 1;
      } else {
        if (cartProductList[index]['qty'] > 1) {
          newQuantity = cartProductList[index]['qty'] - 1;
        } else {
          newQuantity = cartProductList[index]['qty'];
        }
      }
      cartProductList[index]['qty'] = newQuantity;
      cartProductList.refresh();
    }
    calculateTotalPrice();
  }

  void deleteProductFromCart({required dynamic product}) {
    int index = cartProductList
        .indexWhere((element) => element['_id'] == product['_id']);
    if (index != -1) {
      cartProductList.removeAt(index);
      calculateTotalPrice();
    }
  }

  void calculateTotalPrice() {
    totalPrice.value = cartProductList.fold(
        0.0,
        (sum, product) =>
            sum + ((product['qty'] ?? 0) * (product['price'] ?? 0.0)));
  }

  bool productInCart({required dynamic product}) {
    return cartProductList
        .where((element) => element['_id'] == product['_id'])
        .isNotEmpty;
  }
}
