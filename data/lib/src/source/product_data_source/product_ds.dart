import 'package:data/src/entity/remote/response/product_detail_entity.dart';
import 'package:data/src/entity/remote/response/product_entity.dart';

abstract class ProductDataSource {
  Future<ProductEntity> getProductList(Map<String, dynamic> queries);

  Future<ProductDetailEntity> getProductDetail(int id);
}
