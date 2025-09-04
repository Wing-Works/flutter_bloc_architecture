part of 'home_bloc.dart';

class HomeState extends BaseState {
  HomeState({this.list = const <ArticleModel>[]});
  final List<ArticleModel> list;

  HomeState copyWith({List<ArticleModel>? list}) {
    return HomeState(
      list: list ?? this.list,
    );
  }
}
