import 'package:equatable/equatable.dart';
import 'package:fashion_market/core/utils/api_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'add_product_cubit_state.dart';

class AddProductCubit extends Cubit<AddProductCubitState> {
  AddProductCubit() : super(AddProductCubitInitial());

  Future<void> addProduct({
    required String name,
    required String description,
    required double price,
    required String category,
    required String image,
    required int numReviews,
  }) async {
    emit(AddProductCubitLoading());

    try{
    await AddProduct().addProduct(
          name: name,
          price: price,
          description: description,
          image: image,
          category: category,
          numReviews: numReviews);
      emit(AddProductCubitSuccess());
    } catch (e) {
      emit(const AddProductCubitFailure("Failed to add product"));
    }
  }
}
