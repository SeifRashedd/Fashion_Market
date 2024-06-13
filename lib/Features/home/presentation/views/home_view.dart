import 'package:fashion_market/Features/home/presentation/views/widgets/custom_bottom_navigation_bar.dart';
import 'package:fashion_market/Features/home/presentation/views/widgets/home_view_body.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  HomeViewState createState() => HomeViewState();
}

class HomeViewState extends State<HomeView> {
  int selectedIndex = 0;

  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const HomeViewBody(),
      bottomNavigationBar: CustomBottomNavigationBar(onTap: onItemTapped , currentIndex: selectedIndex)
    );
  }
}




