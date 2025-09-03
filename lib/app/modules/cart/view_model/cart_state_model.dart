import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../data/product_model/product_model.dart';

part 'cart_state_model.freezed.dart';
part 'cart_state_model.g.dart';

@freezed
sealed class CartStateModel with _$CartStateModel {
  factory CartStateModel({required Product product, required int quantity}) =
      _CartStateModel;

  factory CartStateModel.fromJson(Map<String, dynamic> json) =>
      _$CartStateModelFromJson(json);
}
