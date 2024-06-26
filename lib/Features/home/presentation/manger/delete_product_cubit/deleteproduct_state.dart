part of 'deleteproduct_cubit.dart';

abstract class DeleteproductState extends Equatable {
  const DeleteproductState();

  @override
  List<Object> get props => [];
}

class DeleteproductInitial extends DeleteproductState {}

class DeleteproductLoading extends DeleteproductState {}

class DeleteproductFailure extends DeleteproductState {
  final String errMsg;

  const DeleteproductFailure(this.errMsg);
}

class DeleteProductSuccess extends DeleteproductState {
  final String productId;
 const DeleteProductSuccess(this.productId);
}