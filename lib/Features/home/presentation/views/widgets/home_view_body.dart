import 'package:fashion_market/Features/home/presentation/views/widgets/home_view_app_bar.dart';
import 'package:fashion_market/Features/home/presentation/views/widgets/product_item_grid_view.dart';
import 'package:fashion_market/Features/home/presentation/views/widgets/promo_code_list_view.dart';
import 'package:fashion_market/core/utils/app_styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const HomeViewAppBar(),
            const Gap(22),
            Text(
              'Welcome,',
              style: AppStyles.styleBold25,
            ),
            Text(
              'Our Fashions App',
              style: AppStyles.styleSemiBold20,
            ),
            const Gap(28),
            const PromoCodeListView(),
            const Gap(28),
            Text(
              'New Arrival',
              style: AppStyles.styleBold18,
            ),
            const Gap(11),
            const Expanded(child: ProductItemGridView()),
          ],
        ),
      ),
    );
  }
}
