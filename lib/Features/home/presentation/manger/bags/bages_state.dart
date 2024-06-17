part of 'bages_cubit.dart';

abstract class BagesState extends Equatable {
  const BagesState();

  @override
  List<Object> get props => [];
}

class BagesInitial extends BagesState {}


class BagesLoading extends BagesState {}

class BagesFailure extends BagesState {
  final String errMsg;

  const BagesFailure(this.errMsg);
}

class BagesSuccess extends BagesState {
  final List<ProductModel> products;

  const BagesSuccess(this.products);


}
