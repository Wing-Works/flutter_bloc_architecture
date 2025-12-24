import 'package:domain/domain.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc_architecture/core/base/bloc/bloc_base/bloc_base.dart';
import 'package:flutter_bloc_architecture/core/base/bloc/event/base_event.dart';
import 'package:flutter_bloc_architecture/core/base/bloc/state/base_state.dart';
import 'package:injectable/injectable.dart';

part 'product_page_event.dart';
part 'product_page_state.dart';

@injectable
class ProductPageBloc extends BlocBase<ProductPageEvent, ProductPageState> {
  ProductPageBloc(this._getProductDetailUseCase)
    : super(const ProductPageState());

  final GetProductDetailUseCase _getProductDetailUseCase;

  @override
  void mapEventToState() {
    on<GetArticlesDataEvent>((event, emit) {
      emit(state.copyWith(productModel: event.value));
    });
  }

  void fetchData(int id) {
    apiCall<ProductModel>(
      _getProductDetailUseCase,
      params: GetProductDetailParams(id: id),
      onSuccess: (data) => add(GetArticlesDataEvent(data)),
    );
  }
}
