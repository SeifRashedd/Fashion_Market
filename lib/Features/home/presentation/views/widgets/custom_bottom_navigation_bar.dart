import 'package:fashion_market/constants.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar(
      {super.key, required this.onTap, required this.currentIndex});

  final int currentIndex;
  final Function(int) onTap;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(30),
        topRight: Radius.circular(30),
      ),
      child: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          const BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: IconButton(
                onPressed: () {
                  GoRouter.of(context).push(kFavoriteView);
                },
                icon: const Icon(Icons.favorite)),
            label: 'Favorite',
          ),
          BottomNavigationBarItem(
            icon: IconButton(
                onPressed: () {
                  GoRouter.of(context).push(kProfileView);
                },
                icon: const Icon(Icons.person)),
            label: 'Profile',
          ),
        ],
        currentIndex: currentIndex,
        selectedItemColor: Colors.black,
        onTap: onTap,
        backgroundColor: Colors.white,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}
