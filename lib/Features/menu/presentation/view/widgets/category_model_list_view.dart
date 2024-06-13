import 'package:fashion_market/Features/menu/presentation/view/data/models/catergoy_model.dart';
import 'package:fashion_market/core/utils/app_images.dart';
import 'package:fashion_market/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class CatrgoryModelListView extends StatelessWidget {
  CatrgoryModelListView({super.key});
  final List<CategotyModel> categotymodel = [
    // CategotyModel(title: 'New Arrival', productCount: '208 Product', categotyImage: categotyImage),
    // CategotyModel(title: 'Clothes', productCount: '308 Product', categotyImage: categotyImage),
    // CategotyModel(title: 'Bags', productCount: '160 Product', categotyImage: categotyImage),
    // CategotyModel(title: 'Shoese', productCount: '230 Product', categotyImage: categotyImage),
    // CategotyModel(title: 'watches', productCount: '80 Product', categotyImage: categotyImage),
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      width: 400,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.white,
      ),
      child: Stack(
        children: [
          Positioned(right: 0, child: AppImages.newArrives),
          Padding(
            padding: const EdgeInsets.only(left: 50),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'New Arrival ',
                  style: AppStyles.styleBold18,
                ),
                Text(
                  '208 Product',
                  style: AppStyles.styleRegular16.copyWith(color: Colors.black),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
