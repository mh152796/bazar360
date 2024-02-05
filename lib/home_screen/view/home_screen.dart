import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3F3EF),
      body: GridView.builder(
        // itemCount: 4,
          itemCount: homeController.homeOrganization.value["data"].length,
          shrinkWrap: true,
          cacheExtent: 300,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate:   SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: MediaQuery.sizeOf(context).width < 340? 1 : 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            mainAxisExtent: 300,

          ),
          itemBuilder: (context, index) {
            return InkWell(
              onTap: (){

                print("print legth---${homeController.homeOrganization.value["data"].length}");
                print(homeController.homeOrganization.value["data"].length);
                Get.to( RechortDescription( orgId:homeController.homeOrganization.value["data"][index]['id'] ,
                  category: '${homeController.homeOrganization.value["data"][index]['category']['name']}'
                  ,title:'${homeController.homeOrganization.value["data"][index]['title']}' ,image: homeController.homeOrganization.value["data"][index]['photos'].isEmpty? "assets":'${homeController.homeOrganization.value["data"][index]['photos'][0]['path']}',));
              },
              child: CustomContainer(
                organizationId: homeController.homeOrganization.value["data"][index]['id'],
                title: '${homeController.homeOrganization.value["data"][index]['title']} ${index == 0?"dhdhdhfjhfhfhfhfhfhffhfc" : ""}',
                imageUrl: homeController.homeOrganization.value["data"][index]['photos'].isEmpty? "assets":'${homeController.homeOrganization.value["data"][index]['photos'][0]['path']}',
                averageRating: '${homeController.homeOrganization.value["data"][index]['averageRating']}',
                category: '${homeController.homeOrganization.value["data"][index]['category']['name']}',
                //averageRating: '0',
                balance: '${homeController.homeOrganization.value["data"][index]['price']}',
              ),

            );
          }
      ),
    );
  }
}
// BottomNavigationBarItem(icon: Image.asset("assets/nav_image/home.png"), label: ""),
// BottomNavigationBarItem(icon: Image.asset("assets/nav_image/category.png"), label: ""),
// BottomNavigationBarItem(icon: Image.asset("assets/nav_image/search.png"), label: ""),
// BottomNavigationBarItem(icon: Image.asset("assets/nav_image/menu.png"), label: ""),