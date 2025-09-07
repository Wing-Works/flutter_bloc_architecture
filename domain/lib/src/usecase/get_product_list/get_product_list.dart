import 'package:dartz/dartz.dart';
import 'package:domain/src/model/error/network_error.dart';
import 'package:domain/src/model/product_list/product_model.dart';
import 'package:domain/src/repository/product_repository/product_repository.dart';
import 'package:domain/src/usecase/base/base_usecase.dart';
import 'package:domain/src/usecase/base/params.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetProductListUseCase
    extends BaseUseCase<GetArticleParams, List<ProductModel>> {
  GetProductListUseCase(this._articleRepository);

  final ProductRepository _articleRepository;

  @override
  Future<Either<NetworkError, List<ProductModel>>> execute(
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
