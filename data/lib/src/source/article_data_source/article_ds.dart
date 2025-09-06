import 'package:data/src/entity/remote/article/article_entity.dart';
import 'package:domain/domain.dart';

abstract class ArticleDataSource {
  Future<ArticleEntity> getArticles(Map<String, dynamic> queries);
}
