import 'package:data/src/util/base_layer_transformer.dart';
import 'package:domain/domain.dart';
import 'package:json_annotation/json_annotation.dart';

part 'product_detail_entity.g.dart';

@JsonSerializable(createFactory: false)
class ProductDetailEntity extends BaseLayerDataTransformer<ProductModel> {
  ProductDetailEntity({required this.products});

  factory ProductDetailEntity.fromJson(Map<String, dynamic> json) {
    return ProductDetailEntity(products: ProductModel.fromJson(json));
  }

  Map<String, dynamic> toJson() => _$ProductDetailEntityToJson(this);

  final ProductModel products;

  @override
  ProductModel get transform => products;
}
