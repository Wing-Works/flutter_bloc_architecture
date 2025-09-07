// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductModel _$ProductModelFromJson(Map<String, dynamic> json) => ProductModel(
  id: (json['id'] as num).toInt(),
  title: json['title'] as String,
  description: json['description'] as String,
  category: json['category'] as String,
  price: (json['price'] as num).toDouble(),
  discountPercentage: (json['discountPercentage'] as num).toDouble(),
  rating: (json['rating'] as num).toDouble(),
  stock: (json['stock'] as num).toInt(),
  tags: (json['tags'] as List<dynamic>).map((e) => e as String).toList(),
  brand: json['brand'] as String,
  sku: json['sku'] as String,
  weight: (json['weight'] as num).toDouble(),
  dimensions: Dimensions.fromJson(json['dimensions'] as Map<String, dynamic>),
  warrantyInformation: json['warrantyInformation'] as String,
  shippingInformation: json['shippingInformation'] as String,
  availabilityStatus: json['availabilityStatus'] as String,
  reviews: (json['reviews'] as List<dynamic>)
      .map((e) => Review.fromJson(e as Map<String, dynamic>))
      .toList(),
  returnPolicy: json['returnPolicy'] as String,
  minimumOrderQuantity: (json['minimumOrderQuantity'] as num).toInt(),
  meta: Meta.fromJson(json['meta'] as Map<String, dynamic>),
  images: (json['images'] as List<dynamic>).map((e) => e as String).toList(),
  thumbnail: json['thumbnail'] as String,
);

Map<String, dynamic> _$ProductModelToJson(ProductModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'category': instance.category,
      'price': instance.price,
      'discountPercentage': instance.discountPercentage,
      'rating': instance.rating,
      'stock': instance.stock,
      'tags': instance.tags,
      'brand': instance.brand,
      'sku': instance.sku,
      'weight': instance.weight,
      'dimensions': instance.dimensions.toJson(),
      'warrantyInformation': instance.warrantyInformation,
      'shippingInformation': instance.shippingInformation,
      'availabilityStatus': instance.availabilityStatus,
      'reviews': instance.reviews.map((e) => e.toJson()).toList(),
      'returnPolicy': instance.returnPolicy,
      'minimumOrderQuantity': instance.minimumOrderQuantity,
      'meta': instance.meta.toJson(),
      'images': instance.images,
      'thumbnail': instance.thumbnail,
    };

Dimensions _$DimensionsFromJson(Map<String, dynamic> json) => Dimensions(
  width: (json['width'] as num).toDouble(),
  height: (json['height'] as num).toDouble(),
  depth: (json['depth'] as num).toDouble(),
);

Map<String, dynamic> _$DimensionsToJson(Dimensions instance) =>
    <String, dynamic>{
      'width': instance.width,
      'height': instance.height,
      'depth': instance.depth,
    };

Review _$ReviewFromJson(Map<String, dynamic> json) => Review(
  rating: (json['rating'] as num).toInt(),
  comment: json['comment'] as String,
  date: DateTime.parse(json['date'] as String),
  reviewerName: json['reviewerName'] as String,
  reviewerEmail: json['reviewerEmail'] as String,
);

Map<String, dynamic> _$ReviewToJson(Review instance) => <String, dynamic>{
  'rating': instance.rating,
  'comment': instance.comment,
  'date': instance.date.toIso8601String(),
  'reviewerName': instance.reviewerName,
  'reviewerEmail': instance.reviewerEmail,
};

Meta _$MetaFromJson(Map<String, dynamic> json) => Meta(
  createdAt: DateTime.parse(json['createdAt'] as String),
  updatedAt: DateTime.parse(json['updatedAt'] as String),
  barcode: json['barcode'] as String,
  qrCode: json['qrCode'] as String,
);

Map<String, dynamic> _$MetaToJson(Meta instance) => <String, dynamic>{
  'createdAt': instance.createdAt.toIso8601String(),
  'updatedAt': instance.updatedAt.toIso8601String(),
  'barcode': instance.barcode,
  'qrCode': instance.qrCode,
};
