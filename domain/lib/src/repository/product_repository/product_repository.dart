import 'package:dartz/dartz.dart';
import 'package:domain/src/model/error/network_error.dart';
import 'package:domain/src/model/product_list/product_model.dart';

abstract class ProductRepository {
  Future<Either<NetworkError, List<ProductModel>>> getArticles(
    Map<String, dynamic> queries,
  );
}
