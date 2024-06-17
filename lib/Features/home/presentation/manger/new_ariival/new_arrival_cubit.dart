import 'package:equatable/equatable.dart';
import 'package:fashion_market/Features/home/data/models/Api/product_model/product_model.dart';
import 'package:fashion_market/Features/home/data/repos/home_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'new_arrival_state.dart';

class NewArrivalCubit extends Cubit<NewArrivalState> {
  NewArrivalCubit(this.homeRepo) : super(NewArrivalInitial());


 final HomeRepo homeRepo; 

 Future<void> fetcNewArrival() async 
 {
  emit(NewArrivalLoading());
  var result = await homeRepo.fetchNewArrivles();
  result.fold((falure) {
    emit(NewArrivalFailure(falure.errMsg));
  }, (products) 
  {
  emit(NewArrivalSuccess(products));
  }
  );
 }
}
