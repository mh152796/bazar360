import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:practice_project/cart_screen/cart_screen.dart';
import 'package:practice_project/category_screen/category_screen.dart';
import 'package:practice_project/home_screen/view/home_screen.dart';
import 'package:practice_project/menu_screen/menu_screen.dart';
import 'package:practice_project/search_screen/search_screen.dart';

import '../cart_screen/cart_controller.dart';

class BottomNavBar extends StatelessWidget {
    BottomNavBar({super.key});
    int currentIndex = 0;
  List<Widget> listOfWidget = [
    HomeScreen(),
    CategoryScreen(),
    SearchScreen(),
    MenuScreen(),

  ];
    final cartController = Get.put(CartController());

    @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: SizedBox(
        height: 60,
        width: 60,
        child: FloatingActionButton(
          shape:
          RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30)),
          backgroundColor: const Color(0xff0db04b),
          onPressed: () async {
            Get.to(()=>CartScreen());
          },
          child:  Obx(() =>   Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Badge(
                backgroundColor: Colors.white,
                textColor: Color(0xff0db04b),
                label: Text(cartController.cartProductList.value.length.toString()),
                child: Icon(Icons.shopping_cart_outlined, color: Colors.white, size: 27,),
              ),
              Text("৳ ${cartController.totalPrice.value}", style: TextStyle(color: Colors.white, fontSize: 13),)
            ],
          )),
        ),
      ),
       bottomNavigationBar: BottomAppBar(
         color: const Color(0xfff9f9f9),
        shape:   const CircularNotchedRectangle(),

         child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(

              width: ((MediaQuery.sizeOf(context).width-100) / 2) ,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {

                    },
                    child: Column(
                      children: [
                        Image.asset("assets/nav_image/home.png", height: 30, width: 30, fit: BoxFit.fill,),
                        const Text("Home")
                      ],
                    ),
                  ),
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {

                    },
                    child: Column(
                      children: [
                        Image.asset("assets/nav_image/category.png", height: 30, width: 30, fit: BoxFit.fill,),
                        const Text("Home")
                      ],
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              width: ((MediaQuery.sizeOf(context).width-100) / 2) ,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {

                    },
                    child: const Column(
                      children: [
                        Icon(Icons.search, color: Colors.grey, size: 30,),
                        // Image.asset("assets/nav_image/search.png", height: 30, fit: BoxFit.fill, width: 30,),
                        Text("Search")
                      ],
                    ),
                  ),
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {

                    },
                    child: Column(
                      children: [
                        Image.asset("assets/nav_image/menu.png", height: 30, width: 30, fit: BoxFit.fill,),
                        const Text("Menu")
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
      body: listOfWidget[currentIndex],
    );
  }
}
