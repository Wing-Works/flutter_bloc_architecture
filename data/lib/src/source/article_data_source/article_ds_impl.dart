import 'package:data/src/entity/remote/article/article_entity.dart';
import 'package:data/src/network/retrofit_service.dart';
import 'package:data/src/source/article_data_source/article_ds.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: ArticleDataSource)
class ArticleDataSourceImpl implements ArticleDataSource {
  ArticleDataSourceImpl(this._retrofitService);

  final RetrofitService _retrofitService;

  @override
  Future<ArticleEntity> getArticles(Map<String, dynamic> queries) {
    return _retrofitService.getArticles(queries);
  }
}
