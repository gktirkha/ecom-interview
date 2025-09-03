import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:magic_extensions/magic_extensions.dart';
import 'package:magic_image/magic_image.dart';

import '../controllers/details_controller.dart';

class DetailsView extends GetView<DetailsController> {
  const DetailsView({super.key});
  @override
  Widget build(BuildContext context) {
    final item = controller.product;
    final tt = Theme.of(context).textTheme;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CupertinoNavigationBar(backgroundColor: Colors.white),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: CustomScrollView(
                  slivers: [
                    SliverList.list(
                      children: [
                        LayoutBuilder(
                          builder: (context, constraints) {
                            return MagicImage(
                              fit: BoxFit.fill,
                              clipBehavior: Clip.antiAlias,
                              boxDecoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              squareDimension: constraints.maxWidth,
                              item.images?.firstOrNull ?? '',
                            );
                          },
                        ),
                        16.height(),
                        Text(item.name ?? '', style: tt.titleLarge),
                        Text(
                          "\$${item.price?.toStringAsFixed(2) ?? ''} + \$${item.tax?.toStringAsFixed(2)} tax",
                        ),
                        12.height(),
                        Text(item.description ?? '', style: tt.bodyLarge),
                        16.height(),
                        Text('Reviews:', style: tt.titleLarge),
                      ],
                    ),

                    SliverList.separated(
                      separatorBuilder: (context, index) => 8.height(),
                      itemBuilder: (context, index) {
                        final rev = controller.reviews[index];
                        return ListTile(
                          contentPadding: EdgeInsets.all(0),
                          minVerticalPadding: 0,
                          title: Row(
                            children: [
                              Text(rev.user ?? '').expanded(),
                              Text('${rev.rating} ⭐'),
                            ],
                          ),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(rev.comment ?? ''),
                              Text('Date: ${rev.date.format()}'),
                            ],
                          ),
                        );
                      },
                      itemCount: controller.reviews.length,
                    ),
                  ],
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              width: double.maxFinite,
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade300,
                    offset: Offset(0, -4),
                    blurRadius: 4,
                  ),
                ],
              ),

              child: Row(
                spacing: 12,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      8.height(),
                      Text('Total Price'),
                      Text(
                        "\$${item.total?.toStringAsFixed(2) ?? ''}",
                        style: tt.titleMedium,
                      ),
                    ],
                  ),
                  Obx(
                    () => (!controller.isAdded)
                        ? Expanded(
                            child: ElevatedButton.icon(
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadiusGeometry.circular(
                                    4,
                                  ),
                                ),
                                backgroundColor: Colors.blue,
                                foregroundColor: Colors.white,
                              ),
                              onPressed: controller.onAdd,
                              label: Text('Add To Cart'),
                              icon: Icon(CupertinoIcons.cart),
                            ),
                          )
                        : Expanded(
                            child: ElevatedButton.icon(
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadiusGeometry.circular(
                                    4,
                                  ),
                                ),
                                backgroundColor: Colors.blue,
                                foregroundColor: Colors.white,
                              ),
                              onPressed: controller.onGoToCart,
                              label: Text('Go To Cart'),
                              icon: Icon(CupertinoIcons.cart),
                            ),
                          ),
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
