part of 'add_product_cubit.dart';

abstract class AddProductCubitState extends Equatable {
  const AddProductCubitState();

  @override
  List<Object> get props => [];
}

class AddProductCubitInitial extends AddProductCubitState {}

class AddProductCubitLoading extends AddProductCubitState {}

class AddProductCubitSuccess extends AddProductCubitState {
}

class AddProductCubitFailure extends AddProductCubitState {
  final String errMsg;

  const AddProductCubitFailure(this.errMsg);

  @override
  List<Object> get props => [errMsg];
}
