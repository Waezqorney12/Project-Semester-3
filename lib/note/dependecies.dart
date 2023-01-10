import 'package:get/get.dart';

import 'package:jaya_office/note/BestItemController.dart';
import 'package:jaya_office/note/apiClient.dart';
import 'package:jaya_office/note/best_item_repo.dart';


Future<void> init() async{
  //api client
  Get.lazyPut(()=>ApiClient(appBaseUrl:""));

  //repository
  Get.lazyPut(() => BestItemRepo(apiClient: Get.find()));

  //controller
  Get.lazyPut(() => BestItemController(bestItemRepo: Get.find()));
  
}