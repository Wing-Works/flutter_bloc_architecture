import 'package:data/src/entity/remote/response/product_entity.dart';
import 'package:data/src/network/retrofit_service.dart';
import 'package:data/src/source/product_data_source/product_ds.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: ProductDataSource)
class ArticleDataSourceImpl implements ProductDataSource {
  ArticleDataSourceImpl(this._retrofitService);

  final RetrofitService _retrofitService;

  @override
  Future<ProductEntity> getProductList(Map<String, dynamic> queries) {
    return _retrofitService.getProductList(queries);
  }
}
