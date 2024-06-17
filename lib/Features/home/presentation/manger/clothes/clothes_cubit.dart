import 'package:equatable/equatable.dart';
import 'package:fashion_market/Features/home/data/models/Api/product_model/product_model.dart';
import 'package:fashion_market/Features/home/data/repos/home_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'clothes_state.dart';

class ClothesCubit extends Cubit<ClothesState> {
  ClothesCubit(this.homeRepo) : super(ClothesInitial());

  final HomeRepo homeRepo;

  Future<void> fetchClothes() async {
    emit(ClothesLoading());
    var result = await homeRepo.fetchClothes();
    result.fold((failure) {
      emit(ClothesFailure(failure.errMsg));
    }, (products) {
      emit(ClothesSuccess(products));
    });
  }
}
