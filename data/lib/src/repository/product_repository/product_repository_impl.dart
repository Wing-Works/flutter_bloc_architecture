import 'package:data/src/source/product_data_source/product_ds.dart';
import 'package:data/src/util/safe_api_call.dart';
import 'package:domain/domain.dart';
import 'package:injectable/injectable.dart';
import 'package:twofold/twofold.dart';

@Injectable(as: ProductRepository)
class ProductRepositoryImpl implements ProductRepository {
  ProductRepositoryImpl({required this.articleDataSource});

  final ProductDataSource articleDataSource;

  @override
  Future<Twofold<List<ProductModel>, NetworkError>> getArticles(
    Map<String, dynamic> queries,
  ) {
    return safeApiCall<List<ProductModel>>(
      () => articleDataSource.getProductList(queries),
    );
  }

  @override
  Future<Twofold<ProductModel, NetworkError>> getProductDetail(int id) {
    return safeApiCall<ProductModel>(
      () => articleDataSource.getProductDetail(id),
    );
  }
}
