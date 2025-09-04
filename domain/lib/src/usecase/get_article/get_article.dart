import 'package:dartz/dartz.dart';
import 'package:domain/src/model/article/article_model.dart';
import 'package:domain/src/model/error/network_error.dart';
import 'package:domain/src/repository/article_repository/article_repository.dart';
import 'package:domain/src/usecase/base/base_usecase.dart';
import 'package:domain/src/usecase/base/params.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetArticleUseCase
    extends BaseUseCase<NetworkError, GetArticleParams, List<ArticleModel>> {
  GetArticleUseCase(this._articleRepository);
  final ArticleRepository _articleRepository;

  @override
  Future<Either<NetworkError, List<ArticleModel>>> execute(
    GetArticleParams params,
  ) {
    return _articleRepository.getArticles(params.toJson);
  }
}

class GetArticleParams extends Params {
  GetArticleParams({required this.limit});

  final int limit;

  @override
  Map<String, dynamic> get toJson {
    return {'limit': limit};
  }
}
