import 'package:get/get.dart';

import 'package:jaya_office/model/ItemProduct.dart';
import 'package:jaya_office/note/best_item_repo.dart';

class BestItemController extends GetxController {
  final BestItemRepo bestItemRepo;
  BestItemController({required this.bestItemRepo});
  List<dynamic> _bestItemList = [];
  List<dynamic> get bestItemList => _bestItemList;

  Future<void> getBestItemList() async {
    Response response = await bestItemRepo.getBestItemList();
    if (response.statusCode == 200) {
      _bestItemList = [];
      _bestItemList.add(ProductModel.fromJson(response.body));
      update();
    } else {}
  }
}
