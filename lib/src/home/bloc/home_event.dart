part of 'home_bloc.dart';

@immutable
sealed class HomeEvent extends BaseEvent {
  const HomeEvent();
}

class GetArticlesEvent extends HomeEvent {
  const GetArticlesEvent(this.list);

  final List<ProductModel> list;
}
