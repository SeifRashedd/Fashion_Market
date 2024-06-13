import 'package:fashion_market/Features/menu/presentation/view/widgets/menu_view_body.dart';
import 'package:flutter/material.dart';

class MenuView extends StatelessWidget {
  const MenuView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xffE2E3E5),
      body: SafeArea(child: MenuViewBody()),
    );
  }
}
