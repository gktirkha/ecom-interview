import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:magic_image/magic_image.dart';
import 'package:shimmer/shimmer.dart';

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
        return InkWell(
          onTap: () {},
          child: GridTile(
            footer: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.name ?? '',
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                Text("\$${item.price?.toStringAsFixed(2) ?? ''}"),
              ],
            ).paddingSymmetric(horizontal: 12, vertical: 8),
            child: Container(
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: MagicImage(
                item.images?.firstOrNull ?? '',
                placeHolderBuilder: (context) => SizedBox(
                  width: double.maxFinite,
                  child: Container(
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding: EdgeInsets.zero,
                    child: Shimmer.fromColors(
                      direction: ShimmerDirection.ttb,
                      baseColor: Colors.grey.shade100,
                      highlightColor: Colors.grey.shade600,
                      child: Container(
                        height: 200,
                        width: double.maxFinite,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
