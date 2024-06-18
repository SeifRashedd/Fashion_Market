import 'dart:developer';
import 'package:dartz/dartz.dart';
import 'package:fashion_market/Features/home/data/models/Api/product_model/product_model.dart';
import 'package:fashion_market/Features/home/data/repos/home_repo.dart';
import 'package:fashion_market/core/errors/failure.dart';
import 'package:fashion_market/core/utils/api_service.dart';

class HomeRepoImpl implements HomeRepo{
  final ApiService apiService;

  HomeRepoImpl(this.apiService);
  
  @override
  Future<Either<Failuer, List<ProductModel>>> fetchCategory({required String categoryname}) async {
     try {
  var data = await apiService.get(endPoint: 'product?category=$categoryname');
  List<ProductModel> products =[];
  for (var item in data['products']) {
    products.add(ProductModel.fromJson(item));
    log(products[item].toString());
  }
  return right(products);
}  catch (e) {
  return left(ServerFailure('error fetching'));
}
    
  }
  


}