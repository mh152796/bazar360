import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../cart_screen/cart_controller.dart';
import '../controller/home_controller.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final homeController = Get.put(HomeController());
  final cartController = Get.put(CartController());

  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFFF3F3EF),
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(100),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Fruits & Vegetables", style: TextStyle(color: Color(0xff333333), fontSize: 25, fontWeight: FontWeight.bold),),
                Container(
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Text("Sort By Position"),
                        Column(
                          children: [
                            GestureDetector(
                                onTap: (){
                                  homeController.sortByAscending();
                                },
                                child: const Icon(Icons.arrow_drop_up, size: 24,)),

                            GestureDetector(
                                onTap: (){
                                  homeController.sortByDescending();
                                },
                                child: const Icon(Icons.arrow_drop_down, size: 24,)),
                          ],
                        ),
                        const Row(
                          children: [
                            Icon(Icons.arrow_downward_rounded),
                            Column(
                              children: [
                                Text(
                                    "A",
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        fontSize: 14.0,
                                        fontWeight: FontWeight.w800,
                                        color: Color(0xff1D1D21))),Text(
                                    "Z",
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        fontSize: 14.0,
                                        fontWeight: FontWeight.w800,
                                        color: Color(0xff1D1D21))),
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 10,),
              ],
            ),
          ),

        ),
        body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10),
            child: Obx(() => switch (homeController.responseStatus.value) {
                  Status.Loading => const Center(
                    child: CircularProgressIndicator(
                        color: Colors.grey,
                      ),
                  ),
                  Status.Completed => GridView.builder(
                      physics: const BouncingScrollPhysics(),
                      shrinkWrap: true,
                      gridDelegate:
                      const SliverGridDelegateWithMaxCrossAxisExtent(
                        crossAxisSpacing: 8.0,
                        mainAxisExtent: 300,
                        mainAxisSpacing: 8.0,
                        maxCrossAxisExtent: 212,
                      ),
                      itemCount: homeController.product.length,
                      // Replace this with the actual number of items you have
                      itemBuilder: (context, index) {
                        return Container(
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Align(
                                alignment: Alignment.centerLeft,
                                child: InkWell(
                                  onTap: () {
                                    cartController.addToCart(product: homeController.product[index]);
                                  },
                                  child: const Padding(
                                    padding: EdgeInsets.only(top: 8.0, left: 8),
                                    child: CircleAvatar(
                                      radius: 15,
                                      backgroundColor: Color(0xff0DB04B),
                                      child: Icon(Icons.add, color: Colors.white,),
                                    ),
                                  ),
                                ),
                              ),
                              Stack(
                                clipBehavior: Clip.none,
                                children: [
                                  Image.asset(
                                    "assets/images/product_image.png",
                                    height: 130,
                                    width: 106,
                                  ),
                                  Positioned(top: -10, right: -40, child: Transform.rotate(
                                    angle: 40 * (3.141592653589793238462 / 180), // Convert degrees to radians
                                    child: Container(
                                      height: 60,
                                      width: 120,
                                      decoration: const BoxDecoration(
                                          image: DecorationImage(
                                              image: AssetImage("assets/images/discount_background.png")
                                          )
                                      ),
                                      child: const Center(
                                        child: Text(
                                          '20% OFF',
                                          style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold, color: Color(0xff744210)),
                                        ),
                                      ),
                                    ),
                                  ),)
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 8.0),
                                child: Align(
                                  alignment: Alignment.centerRight,
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 5, vertical: 3),
                                    color:  homeController.product[index]['isPlastic']!=null? (homeController.product[index]['isPlastic']? const Color(0xffEDF2F7) : const Color(0xffB2F5EA)) : const Color(0xffB2F5EA),
                                    child:   Text(
                                      homeController.product[index]['isPlastic']!=null? (homeController.product[index]['isPlastic']? "WITH PLASTIC" : "PLASTIC FREE") : "PLASTIC FREE",
                                      style: const TextStyle(
                                          color: Color(0xff234E52),
                                          fontSize: 13,
                                          fontWeight: FontWeight.w800),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 5, right: 15.0),
                                  child: Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        "IN STOCK",
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w800,
                                            color: Color(0xff0DB04B)),
                                      ),
                                      Text(
                                          homeController.product[index]['name']??"",
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          style: const TextStyle(
                                              fontSize: 14.0,
                                              fontWeight: FontWeight.w800,
                                              color: Color(0xff1D1D21))),
                                      const Text("1 Kg",
                                          style: TextStyle(
                                              fontSize: 12.0,
                                              color: Color(0xff828282))),
                                      Row(
                                        children: [
                                          Text.rich(TextSpan(
                                              text: "\u09F3",
                                              style: const TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 18),
                                              children: [
                                                TextSpan(
                                                  text:
                                                  " ${homeController.product[index]['price']??""}",
                                                  style: const TextStyle(
                                                      color: Color(0xff1D1D21),
                                                      fontSize: 14,
                                                      fontWeight:
                                                      FontWeight.bold),
                                                )
                                              ])),
                                          const SizedBox(
                                            width: 5,
                                          ),
                                          Text(
                                            "\u09F3 ${homeController.product[index]['price']??""}",
                                            style: const TextStyle(
                                                color:  Color(0xff0DB04B),
                                                fontSize: 13,
                                                decoration:
                                                TextDecoration.lineThrough,
                                                decorationColor: Colors.red
                                            ),
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        );
                      }),
                  Status.Error => const Center(
                      child: Text("Something went wrong..."),
                    ),
                  (_) => const SizedBox.shrink(),
                })),
       ),
    );
  }
}
