import 'package:json_annotation/json_annotation.dart';

part 'product_model.g.dart';

@JsonSerializable(explicitToJson: true)
class ProductModel {
  const ProductModel({
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

  factory ProductModel.fromJson(Map<String, dynamic> json) =>
      _$ProductModelFromJson(json);

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
  final Meta? meta;
  final String thumbnail;
  final List<dynamic>? reviews;
  final Dimensions? dimensions;
  final List<dynamic>? tags;
  final List<dynamic>? images;

  Map<String, dynamic> toJson() => _$ProductModelToJson(this);
}

@JsonSerializable()
class Dimensions {
  const Dimensions({
    required this.width,
    required this.height,
    required this.depth,
  });

  factory Dimensions.fromJson(Map<String, dynamic> json) =>
      _$DimensionsFromJson(json);
  final double width;
  final double height;
  final double depth;

  Map<String, dynamic> toJson() => _$DimensionsToJson(this);
}

@JsonSerializable()
class Review {
  const Review({
    required this.rating,
    required this.comment,
    required this.date,
    required this.reviewerName,
    required this.reviewerEmail,
  });

  factory Review.fromJson(Map<String, dynamic> json) => _$ReviewFromJson(json);
  final int rating;
  final String comment;
  final DateTime date;
  final String reviewerName;
  final String reviewerEmail;

  Map<String, dynamic> toJson() => _$ReviewToJson(this);
}

@JsonSerializable()
class Meta {
  const Meta({
    required this.createdAt,
    required this.updatedAt,
    required this.barcode,
    required this.qrCode,
  });

  factory Meta.fromJson(Map<String, dynamic> json) => _$MetaFromJson(json);
  final DateTime createdAt;
  final DateTime updatedAt;
  final String barcode;
  final String qrCode;

  Map<String, dynamic> toJson() => _$MetaToJson(this);
}
