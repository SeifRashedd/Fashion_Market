import 'package:fashion_market/core/utils/app_images.dart';
import 'package:flutter/material.dart';

class FavoriteViewAppBar extends StatelessWidget {
  const FavoriteViewAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
            height: 42,
            width: 42,
            child: GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: AppImages.backarrow)),
      ],
    );
  }
}