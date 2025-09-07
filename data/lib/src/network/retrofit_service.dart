import 'package:data/src/entity/remote/response/product_entity.dart';
import 'package:data/src/util/network_constant.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'retrofit_service.g.dart';

@RestApi()
abstract class RetrofitService {
  factory RetrofitService(Dio dio, {String? baseUrl}) {
    return _RetrofitService(dio, baseUrl: baseUrl);
  }

  @GET(NetworkConstant.products)
  Future<ProductEntity> getProductList(
    @Queries() Map<String, dynamic> queryParameters,
  );
}
