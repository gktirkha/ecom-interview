import 'package:get/get.dart';

import '../../cart/bindings/cart_binding.dart';
import '../../home/bindings/home_binding.dart';
import '../controllers/dashboard_controller.dart';

class DashboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DashboardController>(() => DashboardController());
    CartBinding().dependencies();
    HomeBinding().dependencies();
  }
}
