import 'package:dio/dio.dart';
import 'package:fashion_market/Features/home/data/repos/home_repo_impl.dart';
import 'package:fashion_market/core/utils/api_service.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setup() {
  getIt.registerSingleton<ApiService>(ApiService(Dio()));
  getIt.registerSingleton<HomeRepoImpl>(
    HomeRepoImpl(
      getIt.get<ApiService>()
    ),
  );
} 
