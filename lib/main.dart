import 'package:fashion_market/Features/home/data/repos/home_repo_impl.dart';
import 'package:fashion_market/Features/home/presentation/manger/favorite_cubit.dart';
import 'package:fashion_market/Features/home/presentation/manger/prodcuts_cubit/products_cubit.dart';
import 'package:fashion_market/constants.dart';
import 'package:fashion_market/core/utils/app_router.dart';
import 'package:fashion_market/core/utils/service_locator.dart';
import 'package:fashion_market/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';

Future<void> main() async {
  setup();
  await Hive.initFlutter();
  await Hive.openBox('Favorites');
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const FashionMarcket());
}

class FashionMarcket extends StatelessWidget {
  const FashionMarcket({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ProductsCubit(
            getIt.get<HomeRepoImpl>(),
          )..fetchProducts(categoryName: kNewAriivalsCategory),
        ),
         BlocProvider(
          create: (context) => FavoritesCubit(),
        ),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerConfig: AppRouter.router,
      ),
    );
  }
}
