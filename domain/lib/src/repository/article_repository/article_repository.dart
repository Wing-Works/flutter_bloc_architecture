import 'package:domain/src/model/article/article_model.dart';
import 'package:domain/src/model/error/network_error.dart';
import 'package:dartz/dartz.dart';

abstract class ArticleRepository {
  Future<Either<NetworkError, List<ArticleModel>>> getArticles(
    Map<String, dynamic> queries,
  );
}
