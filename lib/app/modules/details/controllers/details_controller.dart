import 'package:get/get.dart';

import '../../../data/dummy_data.dart';
import '../../../data/product_model/product_model.dart';
import '../../../data/review_model/review_model.dart';
import '../../cart/controllers/cart_controller.dart';
import '../../dashboard/controllers/dashboard_controller.dart';

class DetailsController extends GetxController {
  final Product product = Get.arguments;

  List<Review> get reviews =>
      ((ReviewModel.fromJson(dummyReviews).reviews ?? {})[product.id
          .toString()]) ??
      [];

  bool get isAdded => Get.find<CartController>().isAdded(product);

  void onAdd() {
    Get.find<CartController>().onAdd(product);
  }

  void onGoToCart() {
    Get.find<DashboardController>().activeIndex.value = 1;
    Get.back();
  }
}
