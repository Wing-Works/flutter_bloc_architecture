import 'package:dartz/dartz.dart';
import 'package:domain/src/model/article/article_model.dart';
import 'package:domain/src/model/error/network_error.dart';

abstract class ArticleRepository {
  Future<Either<NetworkError, List<ArticleModel>>> getArticles(
    Map<String, dynamic> queries,
  );
}
