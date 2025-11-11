part of 'home_bloc.dart';

class HomeState extends BaseState with EquatableMixin {
  const HomeState({this.list = const <ProductModel>[]});

  final List<ProductModel> list;

  HomeState copyWith({List<ProductModel>? list}) {
    return HomeState(list: list ?? this.list);
  }

  @override
  List<Object> get props => [list];
}
