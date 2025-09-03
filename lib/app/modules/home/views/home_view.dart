import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:magic_image/magic_image.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: controller.products.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 8,
        crossAxisSpacing: 8,
      ),
      itemBuilder: (context, index) {
        final item = controller.products[index];
        return GridTile(
          child: Container(
            decoration: BoxDecoration(color: Colors.red),
            child: MagicImage(item.images?.firstOrNull ?? ''),
          ),
        );
      },
    );
  }
}
