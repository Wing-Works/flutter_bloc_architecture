import 'package:domain/src/model/error/network_error.dart';
import 'package:domain/src/model/product_list/product_model.dart';
import 'package:twofold/twofold.dart';

abstract class ProductRepository {
  Future<Twofold<List<ProductModel>, NetworkError>> getArticles(
    Map<String, dynamic> queries,
  );

  Future<Twofold<ProductModel, NetworkError>> getProductDetail(int id);
}
