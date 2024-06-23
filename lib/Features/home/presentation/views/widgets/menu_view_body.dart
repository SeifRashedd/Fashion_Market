import 'package:fashion_market/Features/home/presentation/views/widgets/custom_app_bar.dart';
import 'package:fashion_market/Features/home/presentation/views/widgets/menu_category_model_list_view.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class MenuViewBody extends StatelessWidget {
  const MenuViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Column(
        children: [
          const CustomAppBar(),
          const Gap(20),
          MenuCatrgoryModelListView(),
        ],
      ),
    );
  }
}
