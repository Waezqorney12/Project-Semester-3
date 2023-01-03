import 'package:get/get.dart';
import 'package:jaya_office/data/api/apiClient.dart';
import 'package:jaya_office/data/controller/BestItemController.dart';
import 'package:jaya_office/data/repository/best_item_repo.dart';


Future<void> init() async{
  //api client
  Get.lazyPut(()=>ApiClient(appBaseUrl:""));

  //repository
  Get.lazyPut(() => BestItemRepo(apiClient: Get.find()));

  //controller
  Get.lazyPut(() => BestItemController(bestItemRepo: Get.find()));
  
}