import 'package:domain/domain.dart';
import 'package:json_annotation/json_annotation.dart';

part 'article_entity.g.dart';

@JsonSerializable()
class ArticleEntity
    extends BaseLayerDataTransformer<ArticleEntity, List<ArticleModel>> {
  ArticleEntity({required this.articles});

  factory ArticleEntity.fromJson(Map<String, dynamic> data) {
    final list = data as List;
    return ArticleEntity(
      articles: list
          .map((e) => ArticleModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  final List<ArticleModel> articles;

  @override
  ArticleEntity restore(List<ArticleModel> data) {
    // TODO: implement restore
    throw UnimplementedError();
  }

  @override
  List<ArticleModel> transform() {
    return articles;
  }
}
