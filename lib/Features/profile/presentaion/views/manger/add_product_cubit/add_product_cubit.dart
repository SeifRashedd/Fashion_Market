import 'package:equatable/equatable.dart';
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

    try {
      emit(AddProductCubitSuccess());
    } catch (e) {
      emit(const AddProductCubitFailure("Failed to add product"));
    }
  }
}
