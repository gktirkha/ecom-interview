import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/dashboard_controller.dart';

class DashboardView extends GetView<DashboardController> {
  const DashboardView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: CupertinoNavigationBar(
        middle: Text('Shop'),
        backgroundColor: Colors.white,
      ),
      body: SafeArea(
        child: Obx(
          () => controller.activeWidget.paddingSymmetric(horizontal: 8),
        ),
      ),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          onTap: controller.onTap,
          currentIndex: controller.activeIndex.value,
          backgroundColor: Colors.white,
          elevation: 4,
          items: [
            BottomNavigationBarItem(
              label: 'Home',
              icon: Icon(CupertinoIcons.home),
            ),
            BottomNavigationBarItem(
              label: 'Cart',
              icon: Icon(CupertinoIcons.cart),
            ),
          ],
        ),
      ),
    );
  }
}
