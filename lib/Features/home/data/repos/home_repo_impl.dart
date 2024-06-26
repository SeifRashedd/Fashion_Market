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
  var data = await apiService.get(endPoint: '?category=$categoryname');
  List<ProductModel> products = data.values.toList();
  
  return right(products);
}  catch (e) {
  return left(ServerFailure(e.toString()));
}
    
  }
  


}