import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'cart_controller.dart';

class CartScreen extends StatelessWidget {
  CartScreen({super.key});

  final cartController = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF3F3EF),
      bottomSheet: SizedBox(
        height: 80,
        child: ColoredBox(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
            child: Column(
              children: [
                Obx(() => Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Subtotal",
                          style: TextStyle(
                              color: Color(0xff001E00),
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        ),
                        Text("Tk. ${cartController.totalPrice.value}",
                            style: const TextStyle(
                                color: Color(0xff001E00),
                                fontWeight: FontWeight.bold,
                                fontSize: 18))
                      ],
                    )),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        fixedSize:
                            Size(MediaQuery.sizeOf(context).width - 20, 30),
                        backgroundColor: const Color(0xff0DB04B)),
                    onPressed: () {},
                    child: const Text(
                      "Checkout",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w800),
                    ))
              ],
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Obx(() => SingleChildScrollView(
              child: cartController.cartProductList.isNotEmpty
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Shopping Cart (${cartController.cartProductList.length})",
                          style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w900,
                              color: Color(0xff001E00)),
                        ),
                        Text(
                          "Added items (${cartController.cartProductList.length} Items)",
                          style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w900,
                              color: Color(0xff001E00)),
                        ),
                        ListView.builder(
                          itemCount:
                              cartController.cartProductList.length,
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemBuilder: (context, index) => Row(
                            children: [
                              Image.asset(
                                "assets/images/product_image.png",
                                height: 100,
                                width: 100,
                              ),
                              Expanded(
                                  child: Column(
                                children: [
                                  Text(
                                    cartController.cartProductList[index]
                                        ['name'],
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  Container(
                                      width: 100,
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color: const Color(0xff001E00),
                                              width: 2)),
                                      child: Row(
                                        children: [
                                          IconButton(
                                              onPressed: () {
                                                cartController.updateQuantity(
                                                    product: cartController
                                                        .cartProductList[index],
                                                    isAdd: false);
                                              },
                                              icon: const Icon(Icons.remove)),
                                          Text(
                                            cartController.cartProductList[index]['qty']
                                                .toString(),
                                            style: const TextStyle(
                                                color: Color(0xff001E00),
                                                fontSize: 18,
                                                fontWeight: FontWeight.w800),
                                          ),
                                          IconButton(
                                              onPressed: () {
                                                cartController.updateQuantity(
                                                    product: cartController
                                                        .cartProductList[index]);
                                              },
                                              icon: const Icon(Icons.add)),
                                        ],
                                      ))
                                ],
                              )),
                              Column(
                                children: [
                                  Text(cartController
                                      .cartProductList[index]['price']
                                      .toString()),
                                  IconButton(
                                      onPressed: () {
                                        cartController.deleteProductFromCart(
                                            product: cartController
                                                .cartProductList[index]);
                                      },
                                      icon: const Icon(
                                        Icons.delete,
                                        color: Color(0xffEB5757),
                                      ))
                                ],
                              )
                            ],
                          ),
                        )
                      ],
                    )
                  : const Center(child: Text("No Cart Item")),
            )),
      ),
    );
  }
}
