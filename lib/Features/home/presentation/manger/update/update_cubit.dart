
import 'package:equatable/equatable.dart';
import 'package:fashion_market/Features/home/data/models/Api/product_model/product_model.dart';
import 'package:fashion_market/core/utils/api_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'update_state.dart';

class UpdateCubit extends Cubit<UpdateState> {
  UpdateCubit() : super(UpdateInitial());

  Future<void> updateProduct({
    required String id,
    required String name,
    required double price,
    required String description,
    required String image,
    required String category,
  }) async {
    emit(UpdateLoading());
    try {
      Map<String, dynamic> data = await Api().update(
        url: 'https://fashion-market-backend.onrender.com/api/v1/product/$id',
        body: {
          'name': name,
          'price': price,
          'description': description,
          'image': image,
          'category': category,
        },
      );
      emit(UpdateSuccess(ProductModel.fromJson(data)));
    } catch (e) {
      emit(UpdateFailure(e.toString()));
    }
  }
}
