// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'product_model.dart';

class ProductModelMapper extends ClassMapperBase<ProductModel> {
  ProductModelMapper._();

  static ProductModelMapper? _instance;
  static ProductModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ProductModelMapper._());
      DimensionsMapper.ensureInitialized();
      ReviewMapper.ensureInitialized();
      MetaMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'ProductModel';

  static int _$id(ProductModel v) => v.id;
  static const Field<ProductModel, int> _f$id = Field(
    'id',
    _$id,
    opt: true,
    def: 0,
  );
  static String _$title(ProductModel v) => v.title;
  static const Field<ProductModel, String> _f$title = Field(
    'title',
    _$title,
    opt: true,
    def: '',
  );
  static String _$description(ProductModel v) => v.description;
  static const Field<ProductModel, String> _f$description = Field(
    'description',
    _$description,
    opt: true,
    def: '',
  );
  static String _$category(ProductModel v) => v.category;
  static const Field<ProductModel, String> _f$category = Field(
    'category',
    _$category,
    opt: true,
    def: '',
  );
  static double _$price(ProductModel v) => v.price;
  static const Field<ProductModel, double> _f$price = Field(
    'price',
    _$price,
    opt: true,
    def: 0,
  );
  static double _$discountPercentage(ProductModel v) => v.discountPercentage;
  static const Field<ProductModel, double> _f$discountPercentage = Field(
    'discountPercentage',
    _$discountPercentage,
    opt: true,
    def: 0,
  );
  static double _$rating(ProductModel v) => v.rating;
  static const Field<ProductModel, double> _f$rating = Field(
    'rating',
    _$rating,
    opt: true,
    def: 0,
  );
  static int _$stock(ProductModel v) => v.stock;
  static const Field<ProductModel, int> _f$stock = Field(
    'stock',
    _$stock,
    opt: true,
    def: 0,
  );
  static List<String> _$tags(ProductModel v) => v.tags;
  static const Field<ProductModel, List<String>> _f$tags = Field(
    'tags',
    _$tags,
    opt: true,
    def: const <String>[],
  );
  static String _$brand(ProductModel v) => v.brand;
  static const Field<ProductModel, String> _f$brand = Field(
    'brand',
    _$brand,
    opt: true,
    def: '',
  );
  static String _$sku(ProductModel v) => v.sku;
  static const Field<ProductModel, String> _f$sku = Field(
    'sku',
    _$sku,
    opt: true,
    def: '',
  );
  static double _$weight(ProductModel v) => v.weight;
  static const Field<ProductModel, double> _f$weight = Field(
    'weight',
    _$weight,
    opt: true,
    def: 0,
  );
  static Dimensions? _$dimensions(ProductModel v) => v.dimensions;
  static const Field<ProductModel, Dimensions> _f$dimensions = Field(
    'dimensions',
    _$dimensions,
    opt: true,
  );
  static String _$warrantyInformation(ProductModel v) => v.warrantyInformation;
  static const Field<ProductModel, String> _f$warrantyInformation = Field(
    'warrantyInformation',
    _$warrantyInformation,
    opt: true,
    def: '',
  );
  static String _$shippingInformation(ProductModel v) => v.shippingInformation;
  static const Field<ProductModel, String> _f$shippingInformation = Field(
    'shippingInformation',
    _$shippingInformation,
    opt: true,
    def: '',
  );
  static String _$availabilityStatus(ProductModel v) => v.availabilityStatus;
  static const Field<ProductModel, String> _f$availabilityStatus = Field(
    'availabilityStatus',
    _$availabilityStatus,
    opt: true,
    def: '',
  );
  static List<Review> _$reviews(ProductModel v) => v.reviews;
  static const Field<ProductModel, List<Review>> _f$reviews = Field(
    'reviews',
    _$reviews,
    opt: true,
    def: const <Review>[],
  );
  static String _$returnPolicy(ProductModel v) => v.returnPolicy;
  static const Field<ProductModel, String> _f$returnPolicy = Field(
    'returnPolicy',
    _$returnPolicy,
    opt: true,
    def: '',
  );
  static int _$minimumOrderQuantity(ProductModel v) => v.minimumOrderQuantity;
  static const Field<ProductModel, int> _f$minimumOrderQuantity = Field(
    'minimumOrderQuantity',
    _$minimumOrderQuantity,
    opt: true,
    def: 0,
  );
  static Meta? _$meta(ProductModel v) => v.meta;
  static const Field<ProductModel, Meta> _f$meta = Field(
    'meta',
    _$meta,
    opt: true,
  );
  static List<String> _$images(ProductModel v) => v.images;
  static const Field<ProductModel, List<String>> _f$images = Field(
    'images',
    _$images,
    opt: true,
    def: const <String>[],
  );
  static String _$thumbnail(ProductModel v) => v.thumbnail;
  static const Field<ProductModel, String> _f$thumbnail = Field(
    'thumbnail',
    _$thumbnail,
    opt: true,
    def: '',
  );

  @override
  final MappableFields<ProductModel> fields = const {
    #id: _f$id,
    #title: _f$title,
    #description: _f$description,
    #category: _f$category,
    #price: _f$price,
    #discountPercentage: _f$discountPercentage,
    #rating: _f$rating,
    #stock: _f$stock,
    #tags: _f$tags,
    #brand: _f$brand,
    #sku: _f$sku,
    #weight: _f$weight,
    #dimensions: _f$dimensions,
    #warrantyInformation: _f$warrantyInformation,
    #shippingInformation: _f$shippingInformation,
    #availabilityStatus: _f$availabilityStatus,
    #reviews: _f$reviews,
    #returnPolicy: _f$returnPolicy,
    #minimumOrderQuantity: _f$minimumOrderQuantity,
    #meta: _f$meta,
    #images: _f$images,
    #thumbnail: _f$thumbnail,
  };

  static ProductModel _instantiate(DecodingData data) {
    return ProductModel(
      id: data.dec(_f$id),
      title: data.dec(_f$title),
      description: data.dec(_f$description),
      category: data.dec(_f$category),
      price: data.dec(_f$price),
      discountPercentage: data.dec(_f$discountPercentage),
      rating: data.dec(_f$rating),
      stock: data.dec(_f$stock),
      tags: data.dec(_f$tags),
      brand: data.dec(_f$brand),
      sku: data.dec(_f$sku),
      weight: data.dec(_f$weight),
      dimensions: data.dec(_f$dimensions),
      warrantyInformation: data.dec(_f$warrantyInformation),
      shippingInformation: data.dec(_f$shippingInformation),
      availabilityStatus: data.dec(_f$availabilityStatus),
      reviews: data.dec(_f$reviews),
      returnPolicy: data.dec(_f$returnPolicy),
      minimumOrderQuantity: data.dec(_f$minimumOrderQuantity),
      meta: data.dec(_f$meta),
      images: data.dec(_f$images),
      thumbnail: data.dec(_f$thumbnail),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static ProductModel fromJson(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<ProductModel>(map);
  }

  static ProductModel fromJsonString(String json) {
    return ensureInitialized().decodeJson<ProductModel>(json);
  }
}

mixin ProductModelMappable {
  String toJsonString() {
    return ProductModelMapper.ensureInitialized().encodeJson<ProductModel>(
      this as ProductModel,
    );
  }

  Map<String, dynamic> toJson() {
    return ProductModelMapper.ensureInitialized().encodeMap<ProductModel>(
      this as ProductModel,
    );
  }

  ProductModelCopyWith<ProductModel, ProductModel, ProductModel> get copyWith =>
      _ProductModelCopyWithImpl<ProductModel, ProductModel>(
        this as ProductModel,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return ProductModelMapper.ensureInitialized().stringifyValue(
      this as ProductModel,
    );
  }

  @override
  bool operator ==(Object other) {
    return ProductModelMapper.ensureInitialized().equalsValue(
      this as ProductModel,
      other,
    );
  }

  @override
  int get hashCode {
    return ProductModelMapper.ensureInitialized().hashValue(
      this as ProductModel,
    );
  }
}

extension ProductModelValueCopy<$R, $Out>
    on ObjectCopyWith<$R, ProductModel, $Out> {
  ProductModelCopyWith<$R, ProductModel, $Out> get $asProductModel =>
      $base.as((v, t, t2) => _ProductModelCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class ProductModelCopyWith<$R, $In extends ProductModel, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>> get tags;
  DimensionsCopyWith<$R, Dimensions, Dimensions>? get dimensions;
  ListCopyWith<$R, Review, ReviewCopyWith<$R, Review, Review>> get reviews;
  MetaCopyWith<$R, Meta, Meta>? get meta;
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>> get images;
  $R call({
    int? id,
    String? title,
    String? description,
    String? category,
    double? price,
    double? discountPercentage,
    double? rating,
    int? stock,
    List<String>? tags,
    String? brand,
    String? sku,
    double? weight,
    Dimensions? dimensions,
    String? warrantyInformation,
    String? shippingInformation,
    String? availabilityStatus,
    List<Review>? reviews,
    String? returnPolicy,
    int? minimumOrderQuantity,
    Meta? meta,
    List<String>? images,
    String? thumbnail,
  });
  ProductModelCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _ProductModelCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, ProductModel, $Out>
    implements ProductModelCopyWith<$R, ProductModel, $Out> {
  _ProductModelCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<ProductModel> $mapper =
      ProductModelMapper.ensureInitialized();
  @override
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>> get tags =>
      ListCopyWith(
        $value.tags,
        (v, t) => ObjectCopyWith(v, $identity, t),
        (v) => call(tags: v),
      );
  @override
  DimensionsCopyWith<$R, Dimensions, Dimensions>? get dimensions =>
      $value.dimensions?.copyWith.$chain((v) => call(dimensions: v));
  @override
  ListCopyWith<$R, Review, ReviewCopyWith<$R, Review, Review>> get reviews =>
      ListCopyWith(
        $value.reviews,
        (v, t) => v.copyWith.$chain(t),
        (v) => call(reviews: v),
      );
  @override
  MetaCopyWith<$R, Meta, Meta>? get meta =>
      $value.meta?.copyWith.$chain((v) => call(meta: v));
  @override
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>> get images =>
      ListCopyWith(
        $value.images,
        (v, t) => ObjectCopyWith(v, $identity, t),
        (v) => call(images: v),
      );
  @override
  $R call({
    int? id,
    String? title,
    String? description,
    String? category,
    double? price,
    double? discountPercentage,
    double? rating,
    int? stock,
    List<String>? tags,
    String? brand,
    String? sku,
    double? weight,
    Object? dimensions = $none,
    String? warrantyInformation,
    String? shippingInformation,
    String? availabilityStatus,
    List<Review>? reviews,
    String? returnPolicy,
    int? minimumOrderQuantity,
    Object? meta = $none,
    List<String>? images,
    String? thumbnail,
  }) => $apply(
    FieldCopyWithData({
      if (id != null) #id: id,
      if (title != null) #title: title,
      if (description != null) #description: description,
      if (category != null) #category: category,
      if (price != null) #price: price,
      if (discountPercentage != null) #discountPercentage: discountPercentage,
      if (rating != null) #rating: rating,
      if (stock != null) #stock: stock,
      if (tags != null) #tags: tags,
      if (brand != null) #brand: brand,
      if (sku != null) #sku: sku,
      if (weight != null) #weight: weight,
      if (dimensions != $none) #dimensions: dimensions,
      if (warrantyInformation != null)
        #warrantyInformation: warrantyInformation,
      if (shippingInformation != null)
        #shippingInformation: shippingInformation,
      if (availabilityStatus != null) #availabilityStatus: availabilityStatus,
      if (reviews != null) #reviews: reviews,
      if (returnPolicy != null) #returnPolicy: returnPolicy,
      if (minimumOrderQuantity != null)
        #minimumOrderQuantity: minimumOrderQuantity,
      if (meta != $none) #meta: meta,
      if (images != null) #images: images,
      if (thumbnail != null) #thumbnail: thumbnail,
    }),
  );
  @override
  ProductModel $make(CopyWithData data) => ProductModel(
    id: data.get(#id, or: $value.id),
    title: data.get(#title, or: $value.title),
    description: data.get(#description, or: $value.description),
    category: data.get(#category, or: $value.category),
    price: data.get(#price, or: $value.price),
    discountPercentage: data.get(
      #discountPercentage,
      or: $value.discountPercentage,
    ),
    rating: data.get(#rating, or: $value.rating),
    stock: data.get(#stock, or: $value.stock),
    tags: data.get(#tags, or: $value.tags),
    brand: data.get(#brand, or: $value.brand),
    sku: data.get(#sku, or: $value.sku),
    weight: data.get(#weight, or: $value.weight),
    dimensions: data.get(#dimensions, or: $value.dimensions),
    warrantyInformation: data.get(
      #warrantyInformation,
      or: $value.warrantyInformation,
    ),
    shippingInformation: data.get(
      #shippingInformation,
      or: $value.shippingInformation,
    ),
    availabilityStatus: data.get(
      #availabilityStatus,
      or: $value.availabilityStatus,
    ),
    reviews: data.get(#reviews, or: $value.reviews),
    returnPolicy: data.get(#returnPolicy, or: $value.returnPolicy),
    minimumOrderQuantity: data.get(
      #minimumOrderQuantity,
      or: $value.minimumOrderQuantity,
    ),
    meta: data.get(#meta, or: $value.meta),
    images: data.get(#images, or: $value.images),
    thumbnail: data.get(#thumbnail, or: $value.thumbnail),
  );

  @override
  ProductModelCopyWith<$R2, ProductModel, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _ProductModelCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

class DimensionsMapper extends ClassMapperBase<Dimensions> {
  DimensionsMapper._();

  static DimensionsMapper? _instance;
  static DimensionsMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = DimensionsMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'Dimensions';

  static double _$width(Dimensions v) => v.width;
  static const Field<Dimensions, double> _f$width = Field(
    'width',
    _$width,
    opt: true,
  );
  static double _$height(Dimensions v) => v.height;
  static const Field<Dimensions, double> _f$height = Field(
    'height',
    _$height,
    opt: true,
  );
  static double _$depth(Dimensions v) => v.depth;
  static const Field<Dimensions, double> _f$depth = Field(
    'depth',
    _$depth,
    opt: true,
  );

  @override
  final MappableFields<Dimensions> fields = const {
    #width: _f$width,
    #height: _f$height,
    #depth: _f$depth,
  };

  static Dimensions _instantiate(DecodingData data) {
    return Dimensions(
      width: data.dec(_f$width),
      height: data.dec(_f$height),
      depth: data.dec(_f$depth),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static Dimensions fromJson(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<Dimensions>(map);
  }

  static Dimensions fromJsonString(String json) {
    return ensureInitialized().decodeJson<Dimensions>(json);
  }
}

mixin DimensionsMappable {
  String toJsonString() {
    return DimensionsMapper.ensureInitialized().encodeJson<Dimensions>(
      this as Dimensions,
    );
  }

  Map<String, dynamic> toJson() {
    return DimensionsMapper.ensureInitialized().encodeMap<Dimensions>(
      this as Dimensions,
    );
  }

  DimensionsCopyWith<Dimensions, Dimensions, Dimensions> get copyWith =>
      _DimensionsCopyWithImpl<Dimensions, Dimensions>(
        this as Dimensions,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return DimensionsMapper.ensureInitialized().stringifyValue(
      this as Dimensions,
    );
  }

  @override
  bool operator ==(Object other) {
    return DimensionsMapper.ensureInitialized().equalsValue(
      this as Dimensions,
      other,
    );
  }

  @override
  int get hashCode {
    return DimensionsMapper.ensureInitialized().hashValue(this as Dimensions);
  }
}

extension DimensionsValueCopy<$R, $Out>
    on ObjectCopyWith<$R, Dimensions, $Out> {
  DimensionsCopyWith<$R, Dimensions, $Out> get $asDimensions =>
      $base.as((v, t, t2) => _DimensionsCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class DimensionsCopyWith<$R, $In extends Dimensions, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({double? width, double? height, double? depth});
  DimensionsCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _DimensionsCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, Dimensions, $Out>
    implements DimensionsCopyWith<$R, Dimensions, $Out> {
  _DimensionsCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<Dimensions> $mapper =
      DimensionsMapper.ensureInitialized();
  @override
  $R call({
    Object? width = $none,
    Object? height = $none,
    Object? depth = $none,
  }) => $apply(
    FieldCopyWithData({
      if (width != $none) #width: width,
      if (height != $none) #height: height,
      if (depth != $none) #depth: depth,
    }),
  );
  @override
  Dimensions $make(CopyWithData data) => Dimensions(
    width: data.get(#width, or: $value.width),
    height: data.get(#height, or: $value.height),
    depth: data.get(#depth, or: $value.depth),
  );

  @override
  DimensionsCopyWith<$R2, Dimensions, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _DimensionsCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

class ReviewMapper extends ClassMapperBase<Review> {
  ReviewMapper._();

  static ReviewMapper? _instance;
  static ReviewMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ReviewMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'Review';

  static int _$rating(Review v) => v.rating;
  static const Field<Review, int> _f$rating = Field(
    'rating',
    _$rating,
    opt: true,
  );
  static String _$comment(Review v) => v.comment;
  static const Field<Review, String> _f$comment = Field(
    'comment',
    _$comment,
    opt: true,
  );
  static DateTime _$date(Review v) => v.date;
  static const Field<Review, DateTime> _f$date = Field(
    'date',
    _$date,
    opt: true,
  );
  static String _$reviewerName(Review v) => v.reviewerName;
  static const Field<Review, String> _f$reviewerName = Field(
    'reviewerName',
    _$reviewerName,
    opt: true,
  );
  static String _$reviewerEmail(Review v) => v.reviewerEmail;
  static const Field<Review, String> _f$reviewerEmail = Field(
    'reviewerEmail',
    _$reviewerEmail,
    opt: true,
  );

  @override
  final MappableFields<Review> fields = const {
    #rating: _f$rating,
    #comment: _f$comment,
    #date: _f$date,
    #reviewerName: _f$reviewerName,
    #reviewerEmail: _f$reviewerEmail,
  };

  static Review _instantiate(DecodingData data) {
    return Review(
      rating: data.dec(_f$rating),
      comment: data.dec(_f$comment),
      date: data.dec(_f$date),
      reviewerName: data.dec(_f$reviewerName),
      reviewerEmail: data.dec(_f$reviewerEmail),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static Review fromJson(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<Review>(map);
  }

  static Review fromJsonString(String json) {
    return ensureInitialized().decodeJson<Review>(json);
  }
}

mixin ReviewMappable {
  String toJsonString() {
    return ReviewMapper.ensureInitialized().encodeJson<Review>(this as Review);
  }

  Map<String, dynamic> toJson() {
    return ReviewMapper.ensureInitialized().encodeMap<Review>(this as Review);
  }

  ReviewCopyWith<Review, Review, Review> get copyWith =>
      _ReviewCopyWithImpl<Review, Review>(this as Review, $identity, $identity);
  @override
  String toString() {
    return ReviewMapper.ensureInitialized().stringifyValue(this as Review);
  }

  @override
  bool operator ==(Object other) {
    return ReviewMapper.ensureInitialized().equalsValue(this as Review, other);
  }

  @override
  int get hashCode {
    return ReviewMapper.ensureInitialized().hashValue(this as Review);
  }
}

extension ReviewValueCopy<$R, $Out> on ObjectCopyWith<$R, Review, $Out> {
  ReviewCopyWith<$R, Review, $Out> get $asReview =>
      $base.as((v, t, t2) => _ReviewCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class ReviewCopyWith<$R, $In extends Review, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({
    int? rating,
    String? comment,
    DateTime? date,
    String? reviewerName,
    String? reviewerEmail,
  });
  ReviewCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _ReviewCopyWithImpl<$R, $Out> extends ClassCopyWithBase<$R, Review, $Out>
    implements ReviewCopyWith<$R, Review, $Out> {
  _ReviewCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<Review> $mapper = ReviewMapper.ensureInitialized();
  @override
  $R call({
    Object? rating = $none,
    Object? comment = $none,
    Object? date = $none,
    Object? reviewerName = $none,
    Object? reviewerEmail = $none,
  }) => $apply(
    FieldCopyWithData({
      if (rating != $none) #rating: rating,
      if (comment != $none) #comment: comment,
      if (date != $none) #date: date,
      if (reviewerName != $none) #reviewerName: reviewerName,
      if (reviewerEmail != $none) #reviewerEmail: reviewerEmail,
    }),
  );
  @override
  Review $make(CopyWithData data) => Review(
    rating: data.get(#rating, or: $value.rating),
    comment: data.get(#comment, or: $value.comment),
    date: data.get(#date, or: $value.date),
    reviewerName: data.get(#reviewerName, or: $value.reviewerName),
    reviewerEmail: data.get(#reviewerEmail, or: $value.reviewerEmail),
  );

  @override
  ReviewCopyWith<$R2, Review, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _ReviewCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

class MetaMapper extends ClassMapperBase<Meta> {
  MetaMapper._();

  static MetaMapper? _instance;
  static MetaMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = MetaMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'Meta';

  static DateTime _$createdAt(Meta v) => v.createdAt;
  static const Field<Meta, DateTime> _f$createdAt = Field(
    'createdAt',
    _$createdAt,
    opt: true,
  );
  static DateTime _$updatedAt(Meta v) => v.updatedAt;
  static const Field<Meta, DateTime> _f$updatedAt = Field(
    'updatedAt',
    _$updatedAt,
    opt: true,
  );
  static String _$barcode(Meta v) => v.barcode;
  static const Field<Meta, String> _f$barcode = Field(
    'barcode',
    _$barcode,
    opt: true,
  );
  static String _$qrCode(Meta v) => v.qrCode;
  static const Field<Meta, String> _f$qrCode = Field(
    'qrCode',
    _$qrCode,
    opt: true,
  );

  @override
  final MappableFields<Meta> fields = const {
    #createdAt: _f$createdAt,
    #updatedAt: _f$updatedAt,
    #barcode: _f$barcode,
    #qrCode: _f$qrCode,
  };

  static Meta _instantiate(DecodingData data) {
    return Meta(
      createdAt: data.dec(_f$createdAt),
      updatedAt: data.dec(_f$updatedAt),
      barcode: data.dec(_f$barcode),
      qrCode: data.dec(_f$qrCode),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static Meta fromJson(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<Meta>(map);
  }

  static Meta fromJsonString(String json) {
    return ensureInitialized().decodeJson<Meta>(json);
  }
}

mixin MetaMappable {
  String toJsonString() {
    return MetaMapper.ensureInitialized().encodeJson<Meta>(this as Meta);
  }

  Map<String, dynamic> toJson() {
    return MetaMapper.ensureInitialized().encodeMap<Meta>(this as Meta);
  }

  MetaCopyWith<Meta, Meta, Meta> get copyWith =>
      _MetaCopyWithImpl<Meta, Meta>(this as Meta, $identity, $identity);
  @override
  String toString() {
    return MetaMapper.ensureInitialized().stringifyValue(this as Meta);
  }

  @override
  bool operator ==(Object other) {
    return MetaMapper.ensureInitialized().equalsValue(this as Meta, other);
  }

  @override
  int get hashCode {
    return MetaMapper.ensureInitialized().hashValue(this as Meta);
  }
}

extension MetaValueCopy<$R, $Out> on ObjectCopyWith<$R, Meta, $Out> {
  MetaCopyWith<$R, Meta, $Out> get $asMeta =>
      $base.as((v, t, t2) => _MetaCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class MetaCopyWith<$R, $In extends Meta, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({
    DateTime? createdAt,
    DateTime? updatedAt,
    String? barcode,
    String? qrCode,
  });
  MetaCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _MetaCopyWithImpl<$R, $Out> extends ClassCopyWithBase<$R, Meta, $Out>
    implements MetaCopyWith<$R, Meta, $Out> {
  _MetaCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<Meta> $mapper = MetaMapper.ensureInitialized();
  @override
  $R call({
    Object? createdAt = $none,
    Object? updatedAt = $none,
    Object? barcode = $none,
    Object? qrCode = $none,
  }) => $apply(
    FieldCopyWithData({
      if (createdAt != $none) #createdAt: createdAt,
      if (updatedAt != $none) #updatedAt: updatedAt,
      if (barcode != $none) #barcode: barcode,
      if (qrCode != $none) #qrCode: qrCode,
    }),
  );
  @override
  Meta $make(CopyWithData data) => Meta(
    createdAt: data.get(#createdAt, or: $value.createdAt),
    updatedAt: data.get(#updatedAt, or: $value.updatedAt),
    barcode: data.get(#barcode, or: $value.barcode),
    qrCode: data.get(#qrCode, or: $value.qrCode),
  );

  @override
  MetaCopyWith<$R2, Meta, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _MetaCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

