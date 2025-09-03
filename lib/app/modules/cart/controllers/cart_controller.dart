import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../data/product_model/product_model.dart';
import '../view_model/cart_state_model.dart';

class CartController extends GetxController {
  final cart = <int, CartStateModel>{}.obs;
  int get cartItemCount => cart.length;
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

  // due to time constraints adding local storage here, i would had made a separate helper class for this
  final storage = GetStorage();
  final _cartKey = 'cart';

  @override
  void onInit() {
    initialize();
    super.onInit();
  }

  initialize() {
    final data = storage.read<List<dynamic>>(_cartKey);
    if (data != null) {
      final dataE = <MapEntry<int, CartStateModel>>[];
      for (var element in data) {
        final CartStateModel model = CartStateModel.fromJson(element);
        if (model.product.id != null) {
          dataE.add(MapEntry(model.product.id!, model));
        }
      }
      cart.addAll(Map.fromEntries(dataE));
    }
    cart.listen((data) {
      final storageData = [...data.values.map((e) => e.toJson())];
      storage.write(_cartKey, storageData);
    });
  }
}
