import 'package:fashion_market/Features/menu/presentation/view/widgets/manu_view_app_bar.dart';
import 'package:flutter/material.dart';

class MenuViewBody extends StatelessWidget {
  const MenuViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 25),
          child: MenuViewAppBar(),
        ),
      ],
    );
  }
}
