import 'package:domain/src/model/error/network_error.dart';
import 'package:domain/src/model/product_list/product_model.dart';
import 'package:domain/src/repository/product_repository/product_repository.dart';
import 'package:domain/src/usecase/base/base_usecase.dart';
import 'package:domain/src/usecase/base/params.dart';
import 'package:injectable/injectable.dart';
import 'package:twofold/twofold.dart';

@injectable
class GetProductDetailUseCase
    extends BaseUseCase<GetProductDetailParams, ProductModel> {
  GetProductDetailUseCase(this._articleRepository);

  final ProductRepository _articleRepository;

  @override
  Future<Twofold<ProductModel, NetworkError>> execute(
    GetProductDetailParams params,
  ) {
    return _articleRepository.getProductDetail(params.id);
  }
}

class GetProductDetailParams extends Params {
  GetProductDetailParams({required this.id});

  final int id;

  @override
  Map<String, dynamic> get toJson => {'id': id};
}
