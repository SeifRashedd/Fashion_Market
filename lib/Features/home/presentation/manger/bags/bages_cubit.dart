
import 'package:equatable/equatable.dart';
import 'package:fashion_market/Features/home/data/models/Api/product_model/product_model.dart';
import 'package:fashion_market/Features/home/data/repos/home_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'bages_state.dart';

class BagesCubit extends Cubit<BagesState> {
  BagesCubit(this.homeRepo) : super(BagesInitial());

 final HomeRepo homeRepo; 

 Future<void> fetchBages() async 
 {
  emit(BagesLoading());
  var result = await homeRepo.fetchBags();
  result.fold((falure) {
    emit(BagesFailure(falure.errMsg));
  }, (products) 
  {
  emit(BagesSuccess(products));
  }
  );
 }


}
