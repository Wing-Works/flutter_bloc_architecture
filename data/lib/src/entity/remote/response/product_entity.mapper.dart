// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'product_entity.dart';

class ProductEntityMapper extends ClassMapperBase<ProductEntity> {
  ProductEntityMapper._();

  static ProductEntityMapper? _instance;
  static ProductEntityMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ProductEntityMapper._());
      ProductModelMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'ProductEntity';

  static List<ProductModel> _$products(ProductEntity v) => v.products;
  static const Field<ProductEntity, List<ProductModel>> _f$products = Field(
    'products',
    _$products,
  );

  @override
  final MappableFields<ProductEntity> fields = const {#products: _f$products};

  static ProductEntity _instantiate(DecodingData data) {
    return ProductEntity(products: data.dec(_f$products));
  }

  @override
  final Function instantiate = _instantiate;

  static ProductEntity fromJson(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<ProductEntity>(map);
  }

  static ProductEntity fromJsonString(String json) {
    return ensureInitialized().decodeJson<ProductEntity>(json);
  }
}

mixin ProductEntityMappable {
  String toJsonString() {
    return ProductEntityMapper.ensureInitialized().encodeJson<ProductEntity>(
      this as ProductEntity,
    );
  }

  Map<String, dynamic> toJson() {
    return ProductEntityMapper.ensureInitialized().encodeMap<ProductEntity>(
      this as ProductEntity,
    );
  }

  ProductEntityCopyWith<ProductEntity, ProductEntity, ProductEntity>
  get copyWith => _ProductEntityCopyWithImpl<ProductEntity, ProductEntity>(
    this as ProductEntity,
    $identity,
    $identity,
  );
  @override
  String toString() {
    return ProductEntityMapper.ensureInitialized().stringifyValue(
      this as ProductEntity,
    );
  }

  @override
  bool operator ==(Object other) {
    return ProductEntityMapper.ensureInitialized().equalsValue(
      this as ProductEntity,
      other,
    );
  }

  @override
  int get hashCode {
    return ProductEntityMapper.ensureInitialized().hashValue(
      this as ProductEntity,
    );
  }
}

extension ProductEntityValueCopy<$R, $Out>
    on ObjectCopyWith<$R, ProductEntity, $Out> {
  ProductEntityCopyWith<$R, ProductEntity, $Out> get $asProductEntity =>
      $base.as((v, t, t2) => _ProductEntityCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class ProductEntityCopyWith<$R, $In extends ProductEntity, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<
    $R,
    ProductModel,
    ProductModelCopyWith<$R, ProductModel, ProductModel>
  >
  get products;
  $R call({List<ProductModel>? products});
  ProductEntityCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _ProductEntityCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, ProductEntity, $Out>
    implements ProductEntityCopyWith<$R, ProductEntity, $Out> {
  _ProductEntityCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<ProductEntity> $mapper =
      ProductEntityMapper.ensureInitialized();
  @override
  ListCopyWith<
    $R,
    ProductModel,
    ProductModelCopyWith<$R, ProductModel, ProductModel>
  >
  get products => ListCopyWith(
    $value.products,
    (v, t) => v.copyWith.$chain(t),
    (v) => call(products: v),
  );
  @override
  $R call({List<ProductModel>? products}) =>
      $apply(FieldCopyWithData({if (products != null) #products: products}));
  @override
  ProductEntity $make(CopyWithData data) =>
      ProductEntity(products: data.get(#products, or: $value.products));

  @override
  ProductEntityCopyWith<$R2, ProductEntity, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _ProductEntityCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

