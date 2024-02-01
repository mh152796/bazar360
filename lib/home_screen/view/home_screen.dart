import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3F3EF),
      body: Text("hoem"),
    );
  }
}
// BottomNavigationBarItem(icon: Image.asset("assets/nav_image/home.png"), label: ""),
// BottomNavigationBarItem(icon: Image.asset("assets/nav_image/category.png"), label: ""),
// BottomNavigationBarItem(icon: Image.asset("assets/nav_image/search.png"), label: ""),
// BottomNavigationBarItem(icon: Image.asset("assets/nav_image/menu.png"), label: ""),