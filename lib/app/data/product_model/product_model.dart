import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_model.freezed.dart';
part 'product_model.g.dart';

@freezed
sealed class ProductModel with _$ProductModel {
  const factory ProductModel({
    @JsonKey(name: 'products') List<Product>? products,
  }) = _ProductModel;

  factory ProductModel.fromJson(Map<String, dynamic> json) =>
      _$ProductModelFromJson(json);
}

@freezed
sealed class Product with _$Product {
  const factory Product({
    @JsonKey(name: 'id') int? id,
    @JsonKey(name: 'name') String? name,
    @JsonKey(name: 'category') String? category,
    @JsonKey(name: 'price') double? price,
    @JsonKey(name: 'currency') String? currency,
    @JsonKey(name: 'in_stock') bool? inStock,
    @JsonKey(name: 'rating') double? rating,
    @JsonKey(name: 'reviews_count') int? reviewsCount,
    @JsonKey(name: 'brand') String? brand,
    @JsonKey(name: 'description') String? description,
    @JsonKey(name: 'images') List<String>? images,
  }) = _Product;

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);
}
