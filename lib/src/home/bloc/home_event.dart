part of 'home_bloc.dart';

@immutable
sealed class HomeEvent extends BaseEvent {}

class GetArticlesEvent extends HomeEvent {
  final List<ArticleModel> list;

  GetArticlesEvent(this.list);
}
