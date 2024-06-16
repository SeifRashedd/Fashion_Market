import 'package:dartz/dartz.dart';
import 'package:fashion_market/Features/home/data/models/Api/product_model/product_model.dart';
import 'package:fashion_market/Features/home/data/repos/home_repo.dart';
import 'package:fashion_market/core/errors/failure.dart';

class HomeRepoImpl implements HomeRepo{
  @override
  Future<Either<Failuer, List<ProductModel>>> fetchBags() {
   Dio
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