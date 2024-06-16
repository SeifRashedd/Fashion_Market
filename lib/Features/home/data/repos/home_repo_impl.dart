import 'dart:math'; 
import 'package:dartz/dartz.dart';
import 'package:fashion_market/Features/home/data/models/Api/product_model/product_model.dart';
import 'package:fashion_market/Features/home/data/repos/home_repo.dart';
import 'package:fashion_market/core/errors/failure.dart';
import 'package:fashion_market/core/utils/api_service.dart';

class HomeRepoImpl implements HomeRepo{
  final ApiService apiService;

  HomeRepoImpl(this.apiService);
  @override
  Future<Either<Failuer, List<ProductModel>>> fetchBags() async {
  try {
  var data = await apiService.get(endPoint: 'product?category=bages');
  int count = data['count'];
  log(count);
  List<ProductModel> products =[];
  for (var item in data['products']) {
    products.add(ProductModel.fromJson(item));
  }
  return right(products);
}  catch (e) {
  return left(ServerFailure('error fetching'));
}
  }

  @override
  Future<Either<Failuer, List<ProductModel>>> fetchClothes() {
    // TODO: implement fetchClothes
    throw UnimplementedError();
  }

  @override
  Future<Either<Failuer, List<ProductModel>>> fetchNewArrivles() {
    // TODO: implement fetchNewArrivles
    throw UnimplementedError();
  }

  @override
  Future<Either<Failuer, List<ProductModel>>> fetchShoese() {
    // TODO: implement fetchShoese
    throw UnimplementedError();
  }

  @override
  Future<Either<Failuer, List<ProductModel>>> fetchWatches() {
    // TODO: implement fetchWatches
    throw UnimplementedError();
  }
}