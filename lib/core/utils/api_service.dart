import 'package:dio/dio.dart';
import 'package:fashion_market/Features/home/data/models/Api/product_model/product_model.dart';

class ApiService {
  final _baseUrl = 'https://fashion-market-backend.onrender.com/api/v1/';
  final Dio _dio;

  ApiService(this._dio);

  Future<Map<dynamic, ProductModel>> get({required String endPoint}) async {
    var response = await _dio.get('$_baseUrl$endPoint');
    if (response.statusCode == 200) {
      List<dynamic> data = response.data;

      var products = {
        for (var item in data) item['_id']: ProductModel.fromJson(item)
      };
      return products;
    } else {
      throw Exception('Failed to load products');
    }
  }
}