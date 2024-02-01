import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3F3EF),
      body: GridView.builder(
        itemCount: 5,
        shrinkWrap: true,
        padding: const EdgeInsets.all(16.0),

        gridDelegate:   const SliverGridDelegateWithMaxCrossAxisExtent(
         childAspectRatio: 1, // Adjust this for desired item height/width ratio
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
           maxCrossAxisExtent: 200,

        ),
        itemBuilder: (context, index) {
           return GestureDetector(
             onTap: () => print('Item  tapped!'),
             child: Container(
               height: 700,
               decoration: const BoxDecoration(
                 color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(10))
               ),
                child: Column(
                 crossAxisAlignment: CrossAxisAlignment.center,
                 mainAxisAlignment: MainAxisAlignment.start,
                 children: [
                   Image.asset("assets/images/product_image.png"),
                   const Text("ACI Pure Salt 1kg", style: TextStyle(fontSize: 16.0)),
                   const Text("ACI Pure Salt 1kg", style: TextStyle(fontSize: 16.0)),
                   const Text("ACI Pure Salt 1kg", style: TextStyle(fontSize: 16.0)),
                   const Text("ACI Pure Salt 1kg", style: TextStyle(fontSize: 16.0)),
                   const Text("ACI Pure Salt 1kg", style: TextStyle(fontSize: 16.0)),
                   const Text('price 42', style: TextStyle(fontWeight: FontWeight.bold)),
                 ],
               ),
             ),
           );
        },
      ),
    );
  }
}
// BottomNavigationBarItem(icon: Image.asset("assets/nav_image/home.png"), label: ""),
// BottomNavigationBarItem(icon: Image.asset("assets/nav_image/category.png"), label: ""),
// BottomNavigationBarItem(icon: Image.asset("assets/nav_image/search.png"), label: ""),
// BottomNavigationBarItem(icon: Image.asset("assets/nav_image/menu.png"), label: ""),