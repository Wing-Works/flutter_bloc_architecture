import 'package:data/src/util/base_layer_transformer.dart';
import 'package:domain/domain.dart';
import 'package:json_annotation/json_annotation.dart';

part 'product_detail_entity.g.dart';

@JsonSerializable()
class ProductDetailEntity extends BaseLayerDataTransformer<ProductModel> {
  ProductDetailEntity({required this.products});

  factory ProductDetailEntity.fromJson(Map<String, dynamic> json) {
    return _$ProductDetailEntityFromJson(json);
  }

  final ProductModel products;

  @override
  ProductModel get transform => products;
}
