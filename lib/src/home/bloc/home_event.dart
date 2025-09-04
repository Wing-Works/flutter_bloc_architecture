part of 'home_bloc.dart';

@immutable
sealed class HomeEvent extends BaseEvent {}

class GetArticlesEvent extends HomeEvent {
  GetArticlesEvent(this.list);
  final List<ArticleModel> list;
}
