import 'package:fashion_market/core/utils/app_images.dart';
import 'package:fashion_market/core/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class ProductDetailsViewAppBar extends StatelessWidget {
  const ProductDetailsViewAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
            onTap: () => Navigator.pop(context), child: AppImages.backarrow),
        const Gap(60),
        Text('Product Details',
            style: AppStyles.styleSemiBold20.copyWith(color: Colors.black)),
      ],
    );
  }
}