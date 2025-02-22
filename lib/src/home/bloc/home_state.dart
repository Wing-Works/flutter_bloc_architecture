part of 'home_bloc.dart';

class HomeState extends BaseState {
  final List<ArticleModel> list;

  HomeState({this.list = const <ArticleModel>[]});

  HomeState copyWith({List<ArticleModel>? list}) {
    return HomeState(
      list: list ?? this.list,
    );
  }
}
