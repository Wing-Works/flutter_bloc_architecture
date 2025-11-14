// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_detail_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductDetailEntity _$ProductDetailEntityFromJson(Map<String, dynamic> json) =>
    ProductDetailEntity(
      products: ProductModel.fromJson(json['products'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ProductDetailEntityToJson(
  ProductDetailEntity instance,
) => <String, dynamic>{'products': instance.products};
