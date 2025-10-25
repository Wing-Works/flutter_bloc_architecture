import 'package:dart_mappable/dart_mappable.dart';

part 'product_model.mapper.dart';

@MappableClass()
class ProductModel with ProductModelMappable {
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

@MappableClass()
class Dimensions with DimensionsMappable {
  Dimensions({double? width, double? height, double? depth})
    : width = width ?? 0,
      height = height ?? 0,
      depth = depth ?? 0;

  final double width;
  final double height;
  final double depth;
}

@MappableClass()
class Review with ReviewMappable {
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

  final int rating;
  final String comment;
  final DateTime date;
  final String reviewerName;
  final String reviewerEmail;
}

@MappableClass()
class Meta with MetaMappable {
  Meta({
    DateTime? createdAt,
    DateTime? updatedAt,
    String? barcode,
    String? qrCode,
  }) : createdAt = createdAt ?? DateTime.fromMillisecondsSinceEpoch(0),
       updatedAt = updatedAt ?? DateTime.fromMillisecondsSinceEpoch(0),
       barcode = barcode ?? '',
       qrCode = qrCode ?? '';

  final DateTime createdAt;
  final DateTime updatedAt;
  final String barcode;
  final String qrCode;
}
