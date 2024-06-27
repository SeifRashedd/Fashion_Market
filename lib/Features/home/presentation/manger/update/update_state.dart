part of 'update_cubit.dart';

abstract class UpdateState extends Equatable {
  const UpdateState();

  @override
  List<Object> get props => [];
}

class UpdateInitial extends UpdateState {}

class UpdateLoading extends UpdateState {}

class UpdateFailure extends UpdateState {
  final String errMsg;

  const UpdateFailure(this.errMsg);
}

class UpdateSuccess extends UpdateState {
  final ProductModel product;

  const UpdateSuccess(this.product);

  @override
  List<Object> get props => [product];
}



