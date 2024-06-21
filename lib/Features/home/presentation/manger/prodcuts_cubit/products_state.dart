part of 'products_cubit.dart';

abstract class ProductslState extends Equatable {
  const ProductslState();

  @override
  List<Object> get props => [];
}

class ProductsInitial extends ProductslState {}

class ProductsLoading extends ProductslState {}

class ProductsFailure extends ProductslState {
  final String errMsg;

  const ProductsFailure(this.errMsg);
}

class ProductsSuccess extends ProductslState {
  final List<ProductModel> products;

  const ProductsSuccess(this.products);
}
