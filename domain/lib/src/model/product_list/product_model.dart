import 'package:json_annotation/json_annotation.dart';

part 'product_model.g.dart';

@JsonSerializable()
class ProductModel {
  ProductModel({
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
    this.warrantyInformation = '',
    this.shippingInformation = '',
    this.availabilityStatus = '',
    this.reviews = const <Review>[],
    this.returnPolicy = '',
    this.minimumOrderQuantity = 0,
    this.meta,
    this.images = const <String>[],
    this.thumbnail = '',
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return _$ProductModelFromJson(json);
  }

  final int id;
  final String title;
  final String description;
  final String category;
  final double price;
  final double discountPercentage;
  final double rating;
  final int stock;
  final List<String> tags;
  final String brand;
  final String sku;
  final double weight;
  final Dimensions? dimensions;
  final String warrantyInformation;
  final String shippingInformation;
  final String availabilityStatus;
  final List<Review> reviews;
  final String returnPolicy;
  final int minimumOrderQuantity;
  final Meta? meta;
  final List<String> images;
  final String thumbnail;
}

@JsonSerializable()
class Dimensions {
  Dimensions({double? width, double? height, double? depth})
    : width = width ?? 0,
      height = height ?? 0,
      depth = depth ?? 0;

  factory Dimensions.fromJson(Map<String, dynamic> json) {
    return _$DimensionsFromJson(json);
  }

  final double width;
  final double height;
  final double depth;
}

@JsonSerializable()
class Review {
  Review({
    int? rating,
    String? comment,
    DateTime? date,
    String? reviewerName,
    String? reviewerEmail,
  }) : rating = rating ?? 0,
       comment = comment ?? '',
       date = date ?? DateTime.fromMillisecondsSinceEpoch(0),
       reviewerName = reviewerName ?? '',
       reviewerEmail = reviewerEmail ?? '';

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
  Meta({
    DateTime? createdAt,
    DateTime? updatedAt,
    String? barcode,
    String? qrCode,
  }) : createdAt = createdAt ?? DateTime.fromMillisecondsSinceEpoch(0),
       updatedAt = updatedAt ?? DateTime.fromMillisecondsSinceEpoch(0),
       barcode = barcode ?? '',
       qrCode = qrCode ?? '';

  factory Meta.fromJson(Map<String, dynamic> json) => _$MetaFromJson(json);
  final DateTime createdAt;
  final DateTime updatedAt;
  final String barcode;
  final String qrCode;

  Map<String, dynamic> toJson() => _$MetaToJson(this);
}
