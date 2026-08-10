import 'package:data/src/util/base_layer_transformer.dart';
import 'package:domain/domain.dart';
import 'package:json_annotation/json_annotation.dart';

part 'product_detail_entity.g.dart';

@JsonSerializable(explicitToJson: true)
class ProductDetailEntity extends BaseLayerDataTransformer<ProductModel> {
  const ProductDetailEntity({
    this.id = 0,
    this.title = '',
    this.description = '',
    this.category = '',
    this.price = 0,
    this.discountPercentage = 0,
    this.rating = 0,
    this.stock = 0,
    this.tags = const <String>[],
    this.brand = '',
    this.sku = '',
    this.weight = 0,
    this.dimensions,
    this.warrantyInformation,
    this.shippingInformation,
    this.availabilityStatus,
    this.reviews,
    this.returnPolicy,
    this.minimumOrderQuantity,
    this.meta,
    this.images,
    this.thumbnail = '',
  });

  factory ProductDetailEntity.fromJson(Map<String, dynamic> json) =>
      _$ProductDetailEntityFromJson(json);

  final int id;
  final String title;
  final String description;
  final String category;
  final double price;
  final double discountPercentage;
  final double rating;
  final int stock;
  final String brand;
  final String sku;
  final num weight;
  final String? warrantyInformation;
  final String? shippingInformation;
  final String? availabilityStatus;
  final String? returnPolicy;
  final int? minimumOrderQuantity;
  final MetaEntity? meta;
  final String thumbnail;
  final List<dynamic>? reviews;
  final DimensionsEntity? dimensions;
  final List<dynamic>? tags;
  final List<dynamic>? images;

  Map<String, dynamic> toJson() => _$ProductDetailEntityToJson(this);

  @override
  ProductModel get transform => ProductModel(
    id: id,
    title: title,
    description: description,
    category: category,
    price: price,
    discountPercentage: discountPercentage,
    rating: rating,
    stock: stock,
    tags: tags,
    brand: brand,
    sku: sku,
    weight: weight,
    dimensions: dimensions?.transform,
    warrantyInformation: warrantyInformation,
    shippingInformation: shippingInformation,
    availabilityStatus: availabilityStatus,
    reviews: reviews,
    // We could parse ReviewEntity but the original model just uses dynamic
    returnPolicy: returnPolicy,
    minimumOrderQuantity: minimumOrderQuantity,
    meta: meta?.transform,
    images: images,
    thumbnail: thumbnail,
  );
}

@JsonSerializable()
class DimensionsEntity extends BaseLayerDataTransformer<Dimensions> {
  const DimensionsEntity({
    required this.width,
    required this.height,
    required this.depth,
  });

  factory DimensionsEntity.fromJson(Map<String, dynamic> json) =>
      _$DimensionsEntityFromJson(json);

  final double width;
  final double height;
  final double depth;

  Map<String, dynamic> toJson() => _$DimensionsEntityToJson(this);

  @override
  Dimensions get transform =>
      Dimensions(width: width, height: height, depth: depth);
}

@JsonSerializable()
class ReviewEntity extends BaseLayerDataTransformer<Review> {
  const ReviewEntity({
    required this.rating,
    required this.comment,
    required this.date,
    required this.reviewerName,
    required this.reviewerEmail,
  });

  factory ReviewEntity.fromJson(Map<String, dynamic> json) =>
      _$ReviewEntityFromJson(json);

  final int rating;
  final String comment;
  final DateTime date;
  final String reviewerName;
  final String reviewerEmail;

  Map<String, dynamic> toJson() => _$ReviewEntityToJson(this);

  @override
  Review get transform => Review(
    rating: rating,
    comment: comment,
    date: date,
    reviewerName: reviewerName,
    reviewerEmail: reviewerEmail,
  );
}

@JsonSerializable()
class MetaEntity extends BaseLayerDataTransformer<Meta> {
  const MetaEntity({
    required this.createdAt,
    required this.updatedAt,
    required this.barcode,
    required this.qrCode,
  });

  factory MetaEntity.fromJson(Map<String, dynamic> json) =>
      _$MetaEntityFromJson(json);

  final DateTime createdAt;
  final DateTime updatedAt;
  final String barcode;
  final String qrCode;

  Map<String, dynamic> toJson() => _$MetaEntityToJson(this);

  @override
  Meta get transform => Meta(
    createdAt: createdAt,
    updatedAt: updatedAt,
    barcode: barcode,
    qrCode: qrCode,
  );
}
