import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/cart_controller.dart';

class CartView extends GetView<CartController> {
  const CartView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('CartView'), centerTitle: true),
      body: Center(
        child: Text(
          '${controller.cart.length}',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
