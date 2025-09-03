import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:magic_extensions/magic_extensions.dart';

import '../controllers/cart_controller.dart';
import '../view_model/cart_state_model.dart';

class CartView extends GetView<CartController> {
  const CartView({super.key});
  List<MapEntry<int, CartStateModel>> get cart => [...controller.cart.entries];
  @override
  Widget build(BuildContext context) {
    final tt = Theme.of(context).textTheme;

    return Obx(
      () => cart.isEmpty
          ? Text('Empty Cart').center()
          : Column(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: CustomScrollView(
                      slivers: [
                        16.height().sliverBox,
                        SliverList.separated(
                          itemCount: cart.length,
                          itemBuilder: (context, index) {
                            final item = cart[index].value.product;
                            return Theme(
                              data: ThemeData(dividerColor: Colors.transparent),
                              child: Container(
                                padding: EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: ExpansionTile(
                                  key: ValueKey(item),
                                  tilePadding: EdgeInsets.symmetric(
                                    horizontal: 8,
                                  ),
                                  childrenPadding: EdgeInsets.symmetric(
                                    horizontal: 8,
                                  ),
                                  title: Text(item.name ?? ''),
                                  initiallyExpanded: true,
                                  children: [
                                    Row(
                                      spacing: 8,
                                      children: [
                                        Expanded(child: Text('Item Price')),
                                        Text('\$${item.price}'),
                                      ],
                                    ),
                                    Row(
                                      spacing: 8,
                                      children: [
                                        Expanded(child: Text('Item Tax')),
                                        Text('\$${item.tax}'),
                                      ],
                                    ),
                                    Row(
                                      spacing: 8,
                                      children: [
                                        Expanded(child: Text('Item Total')),
                                        Text('\$${item.total}'),
                                      ],
                                    ),
                                    SizedBox(
                                      width: double.maxFinite,
                                      child: ElevatedButton.icon(
                                        style: ElevatedButton.styleFrom(
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadiusGeometry.circular(
                                                  4,
                                                ),
                                          ),
                                          backgroundColor: Colors.red,
                                          foregroundColor: Colors.white,
                                        ),
                                        onPressed: () {
                                          controller.onSub(item);
                                        },
                                        label: Text('Remove'),
                                        icon: Icon(CupertinoIcons.delete),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                          separatorBuilder: (context, index) => 8.height(),
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
                            "\$${controller.total?.toStringAsFixed(2) ?? ''}",
                            style: tt.titleMedium,
                          ),
                        ],
                      ),
                      Expanded(
                        child: ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadiusGeometry.circular(4),
                            ),
                            backgroundColor: Colors.blue,
                            foregroundColor: Colors.white,
                          ),
                          onPressed: () {},
                          label: Text('Proceed To Pay'),
                          icon: Icon(CupertinoIcons.creditcard),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
    );
  }
}
