import 'dart:convert';
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:fashion_market/Features/home/data/models/Api/product_model/product_model.dart';

class ApiService {
  final _baseUrl = 'https://fashion-market-backend.onrender.com/api/v1/product/';
  final Dio _dio;

  ApiService(this._dio);

  Future<Map<dynamic, ProductModel>> get({required String endPoint}) async {
    var response = await _dio.get('$_baseUrl$endPoint');
    if (response.statusCode == 200 || response.statusCode == 201) {
      List<dynamic> data = response.data;
      var products = {
        for (var item in data) item['_id']: ProductModel.fromJson(item)
      };
      return products;
    } else {
      throw Exception('Failed to load products');
    }
  }

  Future<void> deleteProduct({required String productId}) async {
    final String deleteUrl = '$_baseUrl$productId';

    try {
      Response response = await _dio.delete(deleteUrl);

      if (response.statusCode == 200 || response.statusCode == 201) {
        log('Product with ID $productId was successfully deleted.');
      } else {
        log('Failed to delete product with ID $productId. Status code: ${response.statusCode}, Response: ${response.data}');
      }
    } catch (e) {
      log('An error occurred: $e');
    }
  }
  
}

class Api {
  final Dio _dio = Dio();

  Future<dynamic> post({
    required String url,
    required dynamic body,
  }) async {
    try {
      Response response = await _dio.post(
        url,
        data: body,
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        var responseBody = response.data;
        if (responseBody is String) {
          responseBody = jsonDecode(responseBody);
        }
        return responseBody;
      } else {
        throw Exception(
            'Problem in status code: ${response.statusCode} with body: ${response.data}');
      }
    } catch (e) {
      throw Exception('Failed to post data: $e');
    }
  }
  Future<dynamic> update({
    required String url,
    required dynamic body,
  }) async {
    try {
      Response response = await _dio.put(
        url,
        data: body,
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        var responseBody = response.data;
        if (responseBody is String) {
          responseBody = jsonDecode(responseBody);
        }
        return responseBody;
      } else {
        throw Exception(
            'Problem in status code: ${response.statusCode} with body: ${response.data}');
      }
    } catch (e) {
      throw Exception('Failed to post data: $e');
    }
  }
}

class AddProduct {
  Future<ProductModel> addProduct({
    required String name,
    required double price,
    required String description,
    required String image,
    required String category,
    required int numReviews,
  }) async {
    Map<String, dynamic> data = await Api().post(
      url: 'https://fashion-market-backend.onrender.com/api/v1/product',
      body: {
        'name': name,
        'price': price,
        'description': description,
        'image': image,
        'category': category,
        'numReviews': numReviews,
      },
    );
    return ProductModel.fromJson(data);
  }
}

class UpdateProduct
{
  Future<ProductModel> update({
    required String id,
    required String name,
    required double price,
    required String description,
    required String image,
    required String category,
  }) async {
    Map<String, dynamic> data = await Api().update(
      url: 'https://fashion-market-backend.onrender.com/api/v1/product/$id',
      body: {
        'name': name,
        'price': price,
        'description': description,
        'image': image,
        'category': category,
      },
    );
    return ProductModel.fromJson(data);
  }
}
