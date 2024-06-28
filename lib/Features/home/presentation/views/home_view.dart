import 'package:fashion_market/Features/home/presentation/manger/prodcuts_cubit/products_cubit.dart';
import 'package:fashion_market/Features/home/presentation/views/widgets/custom_bottom_navigation_bar.dart';
import 'package:fashion_market/Features/home/presentation/views/widgets/home_view_body.dart';
import 'package:fashion_market/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
      if (selectedIndex == 0) {
        BlocProvider.of<ProductsCubit>(context)
            .fetchProducts(categoryName: kNewAriivalsCategory);
      }
    });
  }

  @override
  void initState() {
    super.initState();
    BlocProvider.of<ProductsCubit>(context)
        .fetchProducts(categoryName: kNewAriivalsCategory);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: selectedIndex,
        children: const [
          HomeViewBody(),
          // Add other views for different indices if needed
        ],
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        onTap: onItemTapped,
        currentIndex: selectedIndex,
      ),
    );
  }
}
