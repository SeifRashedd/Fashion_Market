import 'package:fashion_market/Features/home/data/models/Api/product_model/product_model.dart';
import 'package:fashion_market/Features/home/presentation/manger/favorite_cubit.dart';
import 'package:fashion_market/Features/home/presentation/views/widgets/custom_app_bar.dart';
import 'package:fashion_market/Features/home/presentation/views/widgets/favorite_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class FavoriteView extends StatelessWidget {
  const FavoriteView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<FavoritesCubit, List<ProductModel>>(
        builder: (context, favorites) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: SafeArea(
              child: Column(
                children: [
                  const CustomAppBar(),
                  const Gap(20),
                  Expanded(
                    child: FavoriteViewBody(
                      favorites: favorites,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
