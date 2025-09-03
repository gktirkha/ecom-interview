import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../cart/views/cart_view.dart';
import '../../home/views/home_view.dart';

class DashboardController extends GetxController {
  final activeIndex = 0.obs;
  final views = [HomeView().paddingSymmetric(horizontal: 8), CartView()];
  Widget get activeWidget => views[activeIndex.value];

  void onTap(int value) {
    activeIndex.value = value;
  }
}
