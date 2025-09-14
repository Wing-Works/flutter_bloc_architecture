import 'package:dartz/dartz.dart';
import 'package:data/src/entity/remote/response/product_entity.dart';
import 'package:data/src/source/product_data_source/product_ds.dart';
import 'package:data/src/util/safe_api_call.dart';
import 'package:domain/domain.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: ProductRepository)
class ProductRepositoryImpl implements ProductRepository {
  ProductRepositoryImpl({required this.articleDataSource});

  final ProductDataSource articleDataSource;

  @override
  Future<Either<NetworkError, List<ProductModel>>> getArticles(
    Map<String, dynamic> queries,
  ) {
    final response = safeApiCall<ProductEntity, List<ProductModel>>(
      articleDataSource.getProductList(queries),
    );
    return response;
  }
}
