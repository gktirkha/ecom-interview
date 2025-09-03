import 'package:get/get.dart';

import '../../../data/dummy_data.dart';
import '../../../data/product_model/product_model.dart';
import '../../cart/controllers/cart_controller.dart';
import '../../dashboard/controllers/dashboard_controller.dart';

class HomeController extends GetxController {
  final products = ProductModel.fromJson(dummyProducts).products ?? [];
  bool isAdded(Product product) {
    return Get.find<CartController>().isAdded(product);
  }

  void onGoToCart() {
    Get.find<DashboardController>().activeIndex.value = 1;
  }

  void onAdd(Product item) {
    Get.find<CartController>().onAdd(item);
  }
}
