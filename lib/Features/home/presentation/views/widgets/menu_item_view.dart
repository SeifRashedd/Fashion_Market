import 'package:fashion_market/Features/home/data/models/Api/product_model/product_model.dart';
import 'package:fashion_market/Features/home/presentation/views/widgets/category_grid_view.dart';
import 'package:fashion_market/Features/home/presentation/views/widgets/manu_view_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class MenuItemView extends StatelessWidget {
  const MenuItemView({super.key, required this.productlist});
  final List<ProductModel> productlist;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            children: [
              const MenuViewAppBar(),
              const Gap(30),
              Expanded(
                  child: CategotyGridView(
                products: productlist,
              ),),
            ],
          ),
        ),
      ),
    );
  }
}
