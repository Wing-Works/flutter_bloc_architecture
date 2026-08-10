// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_detail_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductDetailEntity _$ProductDetailEntityFromJson(Map<String, dynamic> json) =>
    ProductDetailEntity(
      id: (json['id'] as num?)?.toInt() ?? 0,
      title: json['title'] as String? ?? '',
      description: json['description'] as String? ?? '',
      category: json['category'] as String? ?? '',
      price: (json['price'] as num?)?.toDouble() ?? 0,
      discountPercentage: (json['discountPercentage'] as num?)?.toDouble() ?? 0,
      rating: (json['rating'] as num?)?.toDouble() ?? 0,
      stock: (json['stock'] as num?)?.toInt() ?? 0,
      tags: json['tags'] as List<dynamic>? ?? const <String>[],
      brand: json['brand'] as String? ?? '',
      sku: json['sku'] as String? ?? '',
      weight: json['weight'] as num? ?? 0,
      dimensions: json['dimensions'] == null
          ? null
          : DimensionsEntity.fromJson(
              json['dimensions'] as Map<String, dynamic>,
            ),
      warrantyInformation: json['warrantyInformation'] as String?,
      shippingInformation: json['shippingInformation'] as String?,
      availabilityStatus: json['availabilityStatus'] as String?,
      reviews: json['reviews'] as List<dynamic>?,
      returnPolicy: json['returnPolicy'] as String?,
      minimumOrderQuantity: (json['minimumOrderQuantity'] as num?)?.toInt(),
      meta: json['meta'] == null
          ? null
          : MetaEntity.fromJson(json['meta'] as Map<String, dynamic>),
      images: json['images'] as List<dynamic>?,
      thumbnail: json['thumbnail'] as String? ?? '',
    );

Map<String, dynamic> _$ProductDetailEntityToJson(
  ProductDetailEntity instance,
) => <String, dynamic>{
  'id': instance.id,
  'title': instance.title,
  'description': instance.description,
  'category': instance.category,
  'price': instance.price,
  'discountPercentage': instance.discountPercentage,
  'rating': instance.rating,
  'stock': instance.stock,
  'brand': instance.brand,
  'sku': instance.sku,
  'weight': instance.weight,
  'warrantyInformation': instance.warrantyInformation,
  'shippingInformation': instance.shippingInformation,
  'availabilityStatus': instance.availabilityStatus,
  'returnPolicy': instance.returnPolicy,
  'minimumOrderQuantity': instance.minimumOrderQuantity,
  'meta': instance.meta?.toJson(),
  'thumbnail': instance.thumbnail,
  'reviews': instance.reviews,
  'dimensions': instance.dimensions?.toJson(),
  'tags': instance.tags,
  'images': instance.images,
};

DimensionsEntity _$DimensionsEntityFromJson(Map<String, dynamic> json) =>
    DimensionsEntity(
      width: (json['width'] as num).toDouble(),
      height: (json['height'] as num).toDouble(),
      depth: (json['depth'] as num).toDouble(),
    );

Map<String, dynamic> _$DimensionsEntityToJson(DimensionsEntity instance) =>
    <String, dynamic>{
      'width': instance.width,
      'height': instance.height,
      'depth': instance.depth,
    };

ReviewEntity _$ReviewEntityFromJson(Map<String, dynamic> json) => ReviewEntity(
  rating: (json['rating'] as num).toInt(),
  comment: json['comment'] as String,
  date: DateTime.parse(json['date'] as String),
  reviewerName: json['reviewerName'] as String,
  reviewerEmail: json['reviewerEmail'] as String,
);

Map<String, dynamic> _$ReviewEntityToJson(ReviewEntity instance) =>
    <String, dynamic>{
      'rating': instance.rating,
      'comment': instance.comment,
      'date': instance.date.toIso8601String(),
      'reviewerName': instance.reviewerName,
      'reviewerEmail': instance.reviewerEmail,
    };

MetaEntity _$MetaEntityFromJson(Map<String, dynamic> json) => MetaEntity(
  createdAt: DateTime.parse(json['createdAt'] as String),
  updatedAt: DateTime.parse(json['updatedAt'] as String),
  barcode: json['barcode'] as String,
  qrCode: json['qrCode'] as String,
);

Map<String, dynamic> _$MetaEntityToJson(MetaEntity instance) =>
    <String, dynamic>{
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
      'barcode': instance.barcode,
      'qrCode': instance.qrCode,
    };
