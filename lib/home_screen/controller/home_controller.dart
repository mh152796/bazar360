import 'package:get/get.dart';
import 'package:practice_project/config/api_routes.dart';

import '../../network/http_requests.dart';

enum Status { Loading, Completed, Error }


class HomeController extends GetxController{
  final _api = HttpRequests();
   List<dynamic> product = [];
   Rx<Status> responseStatus = Rx(Status.Loading);

   void resetProduct(){
     responseStatus.value = Status.Loading;
     product.clear();
   }

   @override
  void onInit() {
     fetchProductFromApi();
    super.onInit();
  }

   void fetchProductFromApi(){
     responseStatus.value = Status.Loading;
     product.clear();
     _api.get(ApiRoutes.homeUrl).then((value) {
       if(value != null){
         product.addAll(value);
         responseStatus.value = Status.Completed;
       }
       else{
         responseStatus.value = Status.Error;
       }
     });
    }

}