part of 'new_arrival_cubit.dart';

abstract class NewArrivalState extends Equatable {
  const NewArrivalState();

  @override
  List<Object> get props => [];
}

class NewArrivalInitial extends NewArrivalState {}

class NewArrivalLoading extends NewArrivalState {}

class NewArrivalFailure extends NewArrivalState {
  final String errMsg;

  const NewArrivalFailure(this.errMsg);
}

class NewArrivalSuccess extends NewArrivalState {
  final List<ProductModel> products;

 const NewArrivalSuccess(this.products);
}
