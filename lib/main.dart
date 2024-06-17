import 'package:fashion_market/Features/home/data/repos/home_repo_impl.dart';
import 'package:fashion_market/Features/home/presentation/manger/bags/bages_cubit.dart';
import 'package:fashion_market/Features/home/presentation/manger/clothes/clothes_cubit.dart';
import 'package:fashion_market/Features/home/presentation/manger/new_ariival/new_arrival_cubit.dart';
import 'package:fashion_market/Features/home/presentation/manger/shoses/shoes_cubit.dart';
import 'package:fashion_market/Features/home/presentation/manger/watches/watches_cubit.dart';
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
          create: (context) => NewArrivalCubit(getIt.get<HomeRepoImpl>()),
        ),
         BlocProvider(
          create: (context) => BagesCubit(getIt.get<HomeRepoImpl>()),
        ),
        BlocProvider(
          create: (context) => WatchesCubit(getIt.get<HomeRepoImpl>()),
        ),
        BlocProvider(
          create: (context) => ClothesCubit(getIt.get<HomeRepoImpl>()),
        ),
        BlocProvider(
          create: (context) => ShoesCubit(getIt.get<HomeRepoImpl>()),
        ),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerConfig: AppRouter.router,
      ),
    );
  }
}
