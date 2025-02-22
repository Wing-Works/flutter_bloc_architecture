import 'package:domain/domain.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_clean_architecture/core/base/bloc/event/base_event.dart';
import 'package:flutter_clean_architecture/core/base/bloc/bloc_base/bloc_base.dart';
import 'package:flutter_clean_architecture/core/base/bloc/state/base_state.dart';
import 'package:injectable/injectable.dart';

part 'home_event.dart';
part 'home_state.dart';

@injectable
class HomeBloc extends BlocBase<HomeEvent, HomeState> {
  HomeBloc(this._getArticleUseCase) : super(HomeState());

  final GetArticleUseCase _getArticleUseCase;

  @override
  void init() {
    super.init();
    apiCall<List<ArticleModel>>(
      _getArticleUseCase,
      params: GetArticleParams(limit: 5),
      onSuccess: (data) => add(GetArticlesEvent(data)),
    );
  }

  @override
  void mapEventToState() {
    on<GetArticlesEvent>((event, emit) {
      emit(state.copyWith(list: event.list));
    });
  }
}
