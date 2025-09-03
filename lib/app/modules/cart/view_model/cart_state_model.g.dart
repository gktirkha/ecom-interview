// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_state_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CartStateModel _$CartStateModelFromJson(Map<String, dynamic> json) =>
    _CartStateModel(
      product: Product.fromJson(json['product'] as Map<String, dynamic>),
      quantity: (json['quantity'] as num).toInt(),
    );

Map<String, dynamic> _$CartStateModelToJson(_CartStateModel instance) =>
    <String, dynamic>{
      'product': instance.product,
      'quantity': instance.quantity,
    };
