import 'package:domain/domain.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc_architecture/core/base/bloc/bloc_base/bloc_base.dart';
import 'package:flutter_bloc_architecture/core/base/bloc/event/base_event.dart';
import 'package:flutter_bloc_architecture/core/base/bloc/state/base_state.dart';
import 'package:injectable/injectable.dart';

part 'home_event.dart';

part 'home_state.dart';

@injectable
class HomeBloc extends BlocBase<HomeEvent, HomeState> {
  HomeBloc(this._getArticleUseCase) : super(const HomeState());

  final GetProductListUseCase _getArticleUseCase;

  @override
  void init() => fetchData();

  @override
  void mapEventToState() {
    on<GetArticlesEvent>((event, emit) {
      emit(state.copyWith(list: event.list));
    });
  }

  void fetchData() {
    apiCall<List<ProductModel>>(
      _getArticleUseCase,
      params: GetArticleParams(limit: 10),
      onSuccess: (data) => add(GetArticlesEvent(data)),
    );
  }
}
