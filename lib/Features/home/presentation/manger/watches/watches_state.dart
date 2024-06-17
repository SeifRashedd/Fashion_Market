part of 'watches_cubit.dart';

abstract class WatchesState extends Equatable {
  const WatchesState();

  @override
  List<Object> get props => [];
}

class WatchesInitial extends WatchesState {}

class WatchesLoading extends WatchesState {}

class WatchesFailure extends WatchesState {
  final String errMsg;

  const WatchesFailure(this.errMsg);
}

class WatchesSuccess extends WatchesState {
  final List<ProductModel> products;

  const WatchesSuccess(this.products);

  @override
  List<Object> get props => [products];
}
