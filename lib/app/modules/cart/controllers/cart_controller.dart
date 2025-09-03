import 'package:get/get.dart';

import '../../../data/product_model/product_model.dart';
import '../view_model/cart_state_model.dart';

class CartController extends GetxController {
  final cart = <int, CartStateModel>{}.obs;
  onAdd(Product product) {
    final id = product.id;
    if (id == null) return;
    final currentState = cart[id];
    if (currentState == null) {
      cart[id] = CartStateModel(product: product, quantity: 1);
    } else {
      cart[id] = currentState.copyWith(quantity: currentState.quantity + 1);
    }
  }

  onSub(Product product) {
    final id = product.id;
    if (id == null) return;
    final currentState = cart[id];
    if (currentState == null) {
      return;
    } else {
      if (currentState.quantity == 1) {
        cart.remove(id);
      } else {
        cart[id] = currentState.copyWith(quantity: currentState.quantity + 1);
      }
    }
  }

  bool isAdded(Product product) {
    return cart.containsKey(product.id);
  }

  num? get total => cart.entries.fold(
    0,
    (previousValue, element) =>
        (previousValue ?? 0) + (element.value.product.total ?? 0),
  );
}
