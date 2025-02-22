import 'package:data/src/source/article_data_source/article_ds.dart';
import 'package:data/src/util/safe_api_call.dart';
import 'package:domain/domain.dart';
import 'package:injectable/injectable.dart';
import 'package:dartz/dartz.dart';

@Injectable(as: ArticleRepository)
class ArticleRepositoryImpl implements ArticleRepository {
  ArticleRepositoryImpl({required this.articleDataSource});

  final ArticleDataSource articleDataSource;

  @override
  Future<Either<NetworkError, List<ArticleModel>>> getArticles(
    Map<String, dynamic> queries,
  ) {
    return safeApiCall<List<ArticleModel>>(
        articleDataSource.getArticles(queries));
  }
}
