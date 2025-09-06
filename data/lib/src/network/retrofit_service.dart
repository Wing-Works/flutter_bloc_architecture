import 'package:data/src/entity/remote/article/article_entity.dart';
import 'package:data/src/util/network_constant.dart';
import 'package:dio/dio.dart';
import 'package:domain/domain.dart';
import 'package:retrofit/retrofit.dart';

part 'retrofit_service.g.dart';

@RestApi()
abstract class RetrofitService {
  factory RetrofitService(Dio dio, {String? baseUrl}) {
    return _RetrofitService(dio, baseUrl: baseUrl);
  }

  @GET(NetworkConstant.products)
  Future<ArticleEntity> getArticles(
    @Queries() Map<String, dynamic> queryParameters,
  );
}
