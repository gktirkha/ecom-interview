import 'package:get/get.dart';

import '../../../data/dummy_data.dart';
import '../../../data/product_model/product_model.dart';

class HomeController extends GetxController {
  final products = ProductModel.fromJson(dummyProducts).products ?? [];
}
