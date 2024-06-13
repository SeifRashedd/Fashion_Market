import 'package:fashion_market/constants.dart';
import 'package:fashion_market/core/utils/app_images.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            height: 30,
            width: 50,
            child: GestureDetector(
              onTap: ()
              {
                GoRouter.of(context).push(kMenuView);
              },
              child: AppImages.menueImage),
          ),
          const Spacer(
            flex: 1,
          ),
          SizedBox(
              height: 30,
              width: 50,
              child: Image.asset('assets/images/userimage.png'))
        ],
      ),
    );
  }
}
