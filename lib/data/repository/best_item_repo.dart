import 'package:get/get.dart';
import 'package:jaya_office/data/api/apiClient.dart';

class BestItemRepo extends GetxService{
  final ApiClient apiClient;
  BestItemRepo({required this.apiClient});

  Future<Response> getBestItemList() async{
    return await apiClient.getData("http://192.168.1.10/login/product.php");
  }
}