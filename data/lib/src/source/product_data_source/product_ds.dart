import 'package:data/src/entity/remote/response/product_entity.dart';

abstract class ProductDataSource {
  Future<ProductEntity> getProductList(Map<String, dynamic> queries);
}
