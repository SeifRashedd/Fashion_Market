
import 'package:fashion_market/Features/home/data/models/Api/product_model/product_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoritesCubit extends Cubit<List<ProductModel>> {
  FavoritesCubit() : super([]);

  void addFavorite(ProductModel product) {
    final favorites = List<ProductModel>.from(state);
    favorites.add(product);
    emit(favorites);
  }

  void removeFavorite(ProductModel product) {
    final favorites = List<ProductModel>.from(state);
    favorites.remove(product);
    emit(favorites);
  }
}