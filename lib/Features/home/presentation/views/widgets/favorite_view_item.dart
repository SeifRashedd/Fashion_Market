import 'package:fashion_market/core/utils/app_images.dart';
import 'package:fashion_market/core/utils/app_styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';

class FavoriteViewItem extends StatelessWidget {
  const FavoriteViewItem({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: Container(
        height: 100,
        color: Colors.grey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 11),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 80,
                width: 70,
                child: AppImages.productItem,
              ),
              const Gap(15),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Roller Rabbit',
                    style: AppStyles.styleSemiBold16,
                  ),
                  Text(
                    'Vado Odelle Dress',
                    style: AppStyles.styleSemiBold11,
                  ),
                  const Gap(8),
                  Text(
                    r'$198.00',
                    style: AppStyles.styleSemiBold16,
                  ),
                ],
              ),
              const Expanded(child: Gap(1)),
              Align(
                alignment: Alignment.bottomRight,
                child: SizedBox(
                    height: 50, width: 120, child: AppImages.addToCart),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
