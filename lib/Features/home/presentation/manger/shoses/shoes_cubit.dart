import 'package:equatable/equatable.dart';
import 'package:fashion_market/Features/home/data/models/Api/product_model/product_model.dart';
import 'package:fashion_market/Features/home/data/repos/home_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'shoes_state.dart';

class ShoesCubit extends Cubit<ShoesState> {
  ShoesCubit(this.homeRepo) : super(ShoesInitial());

  final HomeRepo homeRepo;

  Future<void> fetchShoese() async {
    emit(ShoesLoading());
    var result = await homeRepo.fetchShoese();
    result.fold((failure) {
      emit(ShoesFailure(failure.errMsg));
    }, (products) {
      emit(ShoesSuccess(products));
    });
  }
}
