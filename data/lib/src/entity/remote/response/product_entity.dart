import 'package:dart_mappable/dart_mappable.dart';
import 'package:data/src/util/base_layer_transformer.dart';
import 'package:domain/domain.dart';

part 'product_entity.mapper.dart';

@MappableClass()
class ProductEntity extends BaseLayerDataTransformer<List<ProductModel>>
    with ProductEntityMappable {
  ProductEntity({required this.products});

  final List<ProductModel> products;

  @override
  List<ProductModel> get transform => products;
}
