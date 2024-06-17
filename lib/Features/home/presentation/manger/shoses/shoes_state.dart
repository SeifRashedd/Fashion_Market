part of 'shoes_cubit.dart';

abstract class ShoesState extends Equatable {
  const ShoesState();

  @override
  List<Object> get props => [];
}

class ShoesInitial extends ShoesState {}

class ShoesLoading extends ShoesState {}

class ShoesFailure extends ShoesState {
  final String errMsg;

  const ShoesFailure(this.errMsg);
}

class ShoesSuccess extends ShoesState {
  final List<ProductModel> products;

  const ShoesSuccess(this.products);

  @override
  List<Object> get props => [products];
}
