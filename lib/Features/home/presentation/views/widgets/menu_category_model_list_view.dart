

import 'package:fashion_market/Features/home/data/models/category_model/catergoy_model.dart';
import 'package:fashion_market/Features/home/presentation/views/widgets/menu_list_view_body.dart';
import 'package:fashion_market/constants.dart';
import 'package:fashion_market/core/utils/app_images.dart';
import 'package:flutter/material.dart';

class MenuCatrgoryModelListView extends StatelessWidget {
  MenuCatrgoryModelListView({
    super.key,
  });
  final List<CategotyModel> categotymodel = [
    CategotyModel(
        kname: kNewAriivalsCategory,
        title: 'New Arrival',
        productCount: '208 Product',
        categotyImage: AppImages.newArrival),
    CategotyModel(
        kname: kClothesCategory,
        title: 'Clothes',
        productCount: '308 Product',
        categotyImage: AppImages.clothesCategory),
    CategotyModel(
        kname: kBagesCategory,
        title: 'Bags',
        productCount: '160 Product',
        categotyImage: AppImages.bagesCategory),
    CategotyModel(
        kname: kShosesCategory,
        title: 'Shoese',
        productCount: '230 Product',
        categotyImage: AppImages.shosesCategory),
    CategotyModel(
        kname: kWatchesCategory,
        title: 'watches',
        productCount: '80 Product',
        categotyImage: AppImages.watchesCategory),
  ];

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: MenuListViewBody(categotyModel: categotymodel),
    );
  }
}
