import 'package:fashion_market/core/utils/app_images.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MenuItemViewAppBar extends StatelessWidget {
  const MenuItemViewAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
            height: 42,
            width: 42,
            child: GestureDetector(
                onTap: () {
                  GoRouter.of(context).pop(); 
                },
                child: AppImages.backarrow)),
        const Spacer(),
      ],
    );
  }
}
