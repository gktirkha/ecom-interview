// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'review_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ReviewModel _$ReviewModelFromJson(Map<String, dynamic> json) => _ReviewModel(
  reviews: (json['reviews'] as Map<String, dynamic>?)?.map(
    (k, e) => MapEntry(
      k,
      (e as List<dynamic>)
          .map((e) => Review.fromJson(e as Map<String, dynamic>))
          .toList(),
    ),
  ),
);

Map<String, dynamic> _$ReviewModelToJson(_ReviewModel instance) =>
    <String, dynamic>{'reviews': instance.reviews};

_Review _$ReviewFromJson(Map<String, dynamic> json) => _Review(
  reviewId: (json['review_id'] as num?)?.toInt(),
  user: json['user'] as String?,
  rating: (json['rating'] as num?)?.toInt(),
  comment: json['comment'] as String?,
  date: json['date'] == null ? null : DateTime.parse(json['date'] as String),
);

Map<String, dynamic> _$ReviewToJson(_Review instance) => <String, dynamic>{
  'review_id': instance.reviewId,
  'user': instance.user,
  'rating': instance.rating,
  'comment': instance.comment,
  'date': instance.date?.toIso8601String(),
};
