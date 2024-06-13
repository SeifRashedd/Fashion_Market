import 'package:fashion_market/Features/home/presentation/views/widgets/custom_app_bar.dart';
import 'package:fashion_market/Features/home/presentation/views/widgets/promo_code_list_view.dart';
import 'package:fashion_market/core/utils/app_images.dart';
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
            const CustomAppBar(),
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
              'New Arrivals',
              style: AppStyles.styleBold18,
            ),
            const Gap(11),
            const ProductItemHomeView()
          ],
        ),
      ),
    );
  }
}

class ProductItemHomeView extends StatefulWidget {
  const ProductItemHomeView({super.key});

  @override
  ProductItemHomeViewState createState() => ProductItemHomeViewState();
}

class ProductItemHomeViewState extends State<ProductItemHomeView> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Stack(children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: SizedBox(
              height: 155,
              width: 170,
              child: AppImages.productItem,
            ),
          ),
          Positioned(
            top: 5,
            right: 10,
            child: GestureDetector(
              onTap: () {
                setState(() {
                  isFavorite = !isFavorite;
                });
              },
              child: Icon(
                Icons.favorite,
                color: isFavorite ? Colors.red : Colors.grey,
              ),
            ),
          ),
        ]),
        const Gap(11),
        Text('The Marc Jacobs', style: AppStyles.styleSemiBold14),
        Text('Traveler Tote', style: AppStyles.styleRegular11),
        Text(r'$195.00', style: AppStyles.styleSemiBold14),
      ],
    );
  }
}
