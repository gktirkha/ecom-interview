import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../cart/controllers/cart_controller.dart';
import '../controllers/dashboard_controller.dart';

class DashboardView extends GetView<DashboardController> {
  const DashboardView({super.key});
  int get count => Get.find<CartController>().cart.length;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: CupertinoNavigationBar(
        leading: Text('Shop', style: Theme.of(context).textTheme.titleLarge),
        backgroundColor: Colors.white,
      ),
      body: SafeArea(child: Obx(() => controller.activeWidget)),
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
              icon: Stack(
                clipBehavior: Clip.none,
                children: [
                  Icon(CupertinoIcons.cart),
                  Obx(
                    () => count > 0
                        ? Positioned(
                            right: -4,
                            top: -4,
                            child: CircleAvatar(
                              radius: 8,
                              child: Center(
                                child: Text(
                                  count < 10 ? count.toString() : '9+',
                                  style: TextStyle(fontSize: 8),
                                ),
                              ),
                            ),
                          )
                        : SizedBox(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
