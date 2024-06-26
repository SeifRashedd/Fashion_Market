import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:fashion_market/core/utils/api_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'deleteproduct_state.dart';

class DeleteproductCubit extends Cubit<DeleteproductState> {
  DeleteproductCubit() : super(DeleteproductInitial());
  
  Future<void> deleteProduct({required String productId}) async
  {
  emit(DeleteproductLoading());
  try {
  await ApiService(Dio()).deleteProduct(productId: productId);
  emit(DeleteProductSuccess(productId));
} catch (e) {
  emit(DeleteproductFailure('an error occurred $e'));
}
  
}
}
