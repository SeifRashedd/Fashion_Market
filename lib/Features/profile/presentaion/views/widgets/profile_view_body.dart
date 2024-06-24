import 'package:fashion_market/Features/auth/presention/views/widgets/custom_button.dart';
import 'package:fashion_market/Features/home/presentation/views/widgets/custom_app_bar.dart';
import 'package:fashion_market/constants.dart';
import 'package:fashion_market/core/utils/app_images.dart';
import 'package:fashion_market/core/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({
    super.key,
    required this.username,
    required this.email,
  });

  final String username;
  final String email;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(children: [
          const CustomAppBar(),
          const Gap(30),
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Container(
              color: Colors.black,
              height: 100,
              width: double.infinity,
              child: Row(
                children: [
                  AppImages.userImage,
                  const Gap(30),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        username,
                        style:
                            AppStyles.styleBold18.copyWith(color: Colors.white),
                      ),
                      Text(
                        email,
                        style: AppStyles.styleRegular16
                            .copyWith(color: Colors.white),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          const Gap(40),
          CustomButton(
            onTap: () {
              GoRouter.of(context).push(kAddProductView);
            },
            text: 'Add a new prduct',
          ),
        ]),
      ),
    );
  }
}
