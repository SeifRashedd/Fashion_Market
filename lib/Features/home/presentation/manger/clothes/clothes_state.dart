part of 'clothes_cubit.dart';

abstract class ClothesState extends Equatable {
  const ClothesState();

  @override
  List<Object> get props => [];
}

class ClothesInitial extends ClothesState {}

class ClothesLoading extends ClothesState {}

class ClothesFailure extends ClothesState {
  final String errMsg;

  const ClothesFailure(this.errMsg);
}

class ClothesSuccess extends ClothesState {
  final List<ProductModel> products;

  const ClothesSuccess(this.products);
}
