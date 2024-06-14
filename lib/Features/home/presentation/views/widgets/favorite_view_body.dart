import 'package:fashion_market/Features/home/presentation/views/widgets/favorite_view_app_bar.dart';
import 'package:fashion_market/Features/home/presentation/views/widgets/favorite_view_item.dart';
import 'package:fashion_market/core/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class FavoriteViewBody extends StatelessWidget {
  const FavoriteViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const FavoriteViewAppBar(),
            const Gap(30),
            Text(
              'Favorite list',
              style: AppStyles.styleBold18,
            ),
            const Gap(20),
            const FavoriteViewItem(),
          ],
        ),
      ),
    );
  }
}
