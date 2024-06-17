import 'package:equatable/equatable.dart';
import 'package:fashion_market/Features/home/data/models/Api/product_model/product_model.dart';
import 'package:fashion_market/Features/home/data/repos/home_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'watches_state.dart';

class WatchesCubit extends Cubit<WatchesState> {
  WatchesCubit(this.homeRepo) : super(WatchesInitial());

  final HomeRepo homeRepo;

  Future<void> fetchWatches() async {
    emit(WatchesLoading());
    var result = await homeRepo.fetchWatches();
    result.fold((failure) {
      emit(WatchesFailure(failure.errMsg));
    }, (products) {
      emit(WatchesSuccess(products));
    });
  }
}
