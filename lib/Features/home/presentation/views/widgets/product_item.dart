import 'package:fashion_market/constants.dart';
import 'package:fashion_market/core/utils/app_images.dart';
import 'package:fashion_market/core/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class ProductItemHomeView extends StatefulWidget {
  const ProductItemHomeView({
    super.key,
  });

  @override
  ProductItemHomeViewState createState() => ProductItemHomeViewState();
}

class ProductItemHomeViewState extends State<ProductItemHomeView> {
  bool isFavorite = false;

  ProductItemHomeViewState();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Stack(children: [
          GestureDetector(
            onTap: () => GoRouter.of(context).push(kProductView),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: SizedBox(
                height: 155,
                width: 170,
                child: AppImages.productItem,
              ),
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
