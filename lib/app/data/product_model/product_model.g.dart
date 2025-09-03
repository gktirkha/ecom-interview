// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ProductModel _$ProductModelFromJson(Map<String, dynamic> json) =>
    _ProductModel(
      products: (json['products'] as List<dynamic>?)
          ?.map((e) => Product.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ProductModelToJson(_ProductModel instance) =>
    <String, dynamic>{'products': instance.products};

_Product _$ProductFromJson(Map<String, dynamic> json) => _Product(
  id: (json['id'] as num?)?.toInt(),
  name: json['name'] as String?,
  category: json['category'] as String?,
  price: (json['price'] as num?)?.toDouble(),
  tax: (json['tax'] as num?)?.toDouble(),
  total: (json['total'] as num?)?.toDouble(),
  currency: json['currency'] as String?,
  inStock: json['in_stock'] as bool?,
  rating: (json['rating'] as num?)?.toDouble(),
  reviewsCount: (json['reviews_count'] as num?)?.toInt(),
  brand: json['brand'] as String?,
  description: json['description'] as String?,
  images: (json['images'] as List<dynamic>?)?.map((e) => e as String).toList(),
);

Map<String, dynamic> _$ProductToJson(_Product instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'category': instance.category,
  'price': instance.price,
  'tax': instance.tax,
  'total': instance.total,
  'currency': instance.currency,
  'in_stock': instance.inStock,
  'rating': instance.rating,
  'reviews_count': instance.reviewsCount,
  'brand': instance.brand,
  'description': instance.description,
  'images': instance.images,
};
