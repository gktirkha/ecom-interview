import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:magic_extensions/magic_extensions.dart';
import 'package:magic_image/magic_image.dart';
import 'package:shimmer/shimmer.dart';

import '../../../routes/app_pages.dart';
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
          onTap: () {
            Get.toNamed(Routes.DETAILS, arguments: item);
          },
          child: GridTile(
            key: ValueKey(item),
            footer: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.name ?? '',
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                Row(
                  children: [
                    Text(
                      "\$${item.total?.toStringAsFixed(2) ?? ''}",
                    ).expanded(),
                    Obx(
                      () => controller.isAdded(item)
                          ? IconButton(
                              onPressed: controller.onGoToCart,
                              icon: Icon(Icons.arrow_forward_ios),
                            )
                          : IconButton(
                              onPressed: () {
                                controller.onAdd(item);
                              },
                              icon: Icon(Icons.add),
                            ),
                    ),
                  ],
                ),
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
