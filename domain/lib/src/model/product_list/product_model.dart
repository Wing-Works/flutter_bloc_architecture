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
}

class Dimensions {
  const Dimensions({
    required this.width,
    required this.height,
    required this.depth,
  });

  final double width;
  final double height;
  final double depth;
}

class Review {
  const Review({
    required this.rating,
    required this.comment,
    required this.date,
    required this.reviewerName,
    required this.reviewerEmail,
  });

  final int rating;
  final String comment;
  final DateTime date;
  final String reviewerName;
  final String reviewerEmail;
}

class Meta {
  const Meta({
    required this.createdAt,
    required this.updatedAt,
    required this.barcode,
    required this.qrCode,
  });

  final DateTime createdAt;
  final DateTime updatedAt;
  final String barcode;
  final String qrCode;
}
