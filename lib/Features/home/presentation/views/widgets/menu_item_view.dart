import 'package:fashion_market/Features/home/presentation/views/widgets/manu_view_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'product_item_grid_view.dart';

class MenuItemView extends StatelessWidget {
  const MenuItemView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            children: [
              MenuViewAppBar(),
              Gap(30),
              Expanded(child: ProductItemGridView()),
            ],
          ),
        ),
      ),
    );
  }
}
