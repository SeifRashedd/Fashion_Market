import 'package:fashion_market/Features/home/presentation/views/widgets/promo_code_item.dart';
import 'package:fashion_market/core/utils/app_images.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class PromoCodeListView extends StatelessWidget {
  const PromoCodeListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          PromoCard(
            image: AppImages.promoCodeImage1,
            discountText: '50% off',
            descriptionText: 'On everything today',
            codeText: 'with code : SeifRashed',
          ),
          const Gap(10),
          PromoCard(
            image: AppImages.promoCodeImage2,
            discountText: '70% off',
            descriptionText: 'On the watches collection',
            codeText: 'with code : SeifRashed',
          ),
        ],
      ),
    );
  }
}
