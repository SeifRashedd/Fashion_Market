import 'package:equatable/equatable.dart';
import 'package:fashion_market/Features/home/data/models/Api/product_model/product_model.dart';
import 'package:fashion_market/Features/home/data/repos/home_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'new_arrival_state.dart';

class ProductsCubit extends Cubit<ProductslState> {
  ProductsCubit(this.homeRepo) : super(ProductsInitial());

  final HomeRepo homeRepo;

  Future<void> fetchProducts({required String categoryName}) async {
    emit(ProductsLoading());
    var result = await homeRepo.fetchCategory(categoryname: categoryName);
    result.fold((falure) {
      emit(ProductsFailure(falure.errMsg));
    }, (products) {
      emit(ProductsSuccess(products));
    });
  }
}
