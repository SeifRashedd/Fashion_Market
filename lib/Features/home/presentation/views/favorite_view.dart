import 'package:fashion_market/Features/home/data/models/Api/product_model/product_model.dart';
import 'package:fashion_market/Features/home/presentation/manger/favorite_cubit.dart';
import 'package:fashion_market/Features/home/presentation/views/widgets/favorite_view_app_bar.dart';
import 'package:fashion_market/core/utils/app_styles.dart';
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
                  const FavoriteViewAppBar(),
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

class FavoriteViewBody extends StatelessWidget {
  const FavoriteViewBody({
    super.key,
    required this.favorites,
  });

  final List<ProductModel> favorites;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: favorites.length,
      itemBuilder: (context, index) {
        final product = favorites[index];
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Container(
              height: 100,
              color: Colors.grey,
              child: Row(
                children: [
                  SizedBox(
                    child: Image.network(
                      height: 100,
                      width: 100,
                      product.image,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const Gap(15),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        product.name,
                        style: AppStyles.styleSemiBold16,
                      ),
                      const Gap(8),
                    ],
                  ),
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: Text(
                      '\$${product.price.toString()}',
                      style: AppStyles.styleSemiBold16,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
