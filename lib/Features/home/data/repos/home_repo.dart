import 'package:dartz/dartz.dart';
import 'package:fashion_market/Features/home/data/models/Api/product_model/product_model.dart';
import 'package:fashion_market/core/errors/failure.dart';

abstract class HomeRepo {
  Future<Either<Failuer, List<ProductModel>>> fetchNewArrivles();
  Future<Either<Failuer, List<ProductModel>>> fetchBags();
  Future<Either<Failuer, List<ProductModel>>> fetchClothes();
  // Future<Either<Failuer, List<ProductModel>>> fetchShoese();
  Future<Either<Failuer, List<ProductModel>>> fetchWatches();
}
