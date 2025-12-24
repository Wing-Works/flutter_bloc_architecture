part of 'product_page_bloc.dart';

@immutable
sealed class ProductPageEvent extends BaseEvent {
  const ProductPageEvent();
}

class GetArticlesDataEvent extends ProductPageEvent {
  const GetArticlesDataEvent(this.value);

  final ProductModel value;
}
