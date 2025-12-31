part of 'product_page_bloc.dart';

final class ProductPageState extends BaseState with EquatableMixin {
  const ProductPageState({this.productModel = const ProductModel()});

  final ProductModel productModel;

  ProductPageState copyWith({ProductModel? productModel}) {
    return ProductPageState(productModel: productModel ?? this.productModel);
  }

  @override
  List<Object> get props => [productModel];
}
