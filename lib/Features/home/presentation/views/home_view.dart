import 'package:fashion_market/Features/home/presentation/views/widgets/custom_app_bar.dart';
import 'package:fashion_market/core/utils/app_images.dart';
import 'package:fashion_market/core/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
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
              // const CustomSaleItem(),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomSaleItem extends StatelessWidget {
  const CustomSaleItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 260,
        width: 200,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(16)),
        child: Row(
          children: [
            Column(
              children: [
                Text('50% Off', style: AppStyles.styleBold25),
                Text('On everything today', style: AppStyles.styleRegular16),
                const Gap(10),
                Text('With code:Seif20', style: AppStyles.styleSemiBold11),
              ],
            ),
            Expanded(child: AppImages.itemSaleImage)
          ],
        ));
  }
}
