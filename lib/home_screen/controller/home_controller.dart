import 'package:get/get.dart';
import 'package:practice_project/config/api_routes.dart';

import '../../cart_screen/cart_controller.dart';
import '../../data/local_db/db_helper.dart';
import '../../data/network/network_api_services.dart';


enum Status { Loading, Completed, Error }


class HomeController extends GetxController{
  final _api = NetworkApiServices();
  final cartController = Get.put(CartController());
  final dbHelper = DbHelper();
   RxList<dynamic> product = [].obs;
   Rx<Status> responseStatus = Rx(Status.Loading);

   RxBool isSorting = false.obs;

   void resetProduct(){
     responseStatus.value = Status.Loading;
     product.clear();
   }

   @override
  void onInit() {
     fetchProductFromApi();
    super.onInit();
  }

  Future<void> sortByAscending() async {
    isSorting.value = true;
    await Future.delayed(Duration.zero); // Allow the UI to build before sorting

    product.sort((a, b) {
      // Check for null values
      if (a["name"] == null && b["name"] == null) {
        return 0; // Both names are null, consider them equal
      } else if (a["name"] == null) {
        return -1; // Null comes before a non-null value
      } else if (b["name"] == null) {
        return 1; // Null comes before a non-null value
      } else {
        return a["name"].compareTo(b["name"]);
      }
    });
    isSorting.value = false;

  }

  Future<void> sortByDescending() async {
    isSorting.value = true;

    await Future.delayed(Duration.zero); // Allow the UI to build before sorting

    product.sort((a, b) {
      // Check for null values
      if (a["name"] == null && b["name"] == null) {
        return 0; // Both names are null, consider them equal
      } else if (a["name"] == null) {
        return 1; // Null comes after a non-null value
      } else if (b["name"] == null) {
        return -1; // Null comes after a non-null value
      } else {
        return b["name"].compareTo(a["name"]);
      }
    });
    isSorting.value = false;

  }


  Future<void> fetchProductFromApi() async {
     responseStatus.value = Status.Loading;
     product.clear();
     _api.getApi(url: ApiRoutes.homeUrl).then((value) async {
       if(value != null){
          product.addAll(value);

         final localCartData = await dbHelper.getAllItemsFromLocalDb();
           if(localCartData.isNotEmpty){
             cartController.cartProductList.addAll(localCartData);
           }
           responseStatus.value = Status.Completed;
       }
       else{
         responseStatus.value = Status.Error;
       }
     }).onError((error, stackTrace) {
       responseStatus.value = Status.Error;
     });
    }
}