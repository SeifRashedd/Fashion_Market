import 'package:fashion_market/Features/home/data/models/category_model/catergoy_model.dart';
import 'package:fashion_market/Features/home/presentation/views/widgets/category_list_view_body.dart';
import 'package:fashion_market/core/utils/app_images.dart';
import 'package:flutter/material.dart';

class CatrgoryModelListView extends StatelessWidget {
  CatrgoryModelListView({
    super.key,
  });
  final List<CategotyModel> categotymodel = [
    CategotyModel(
        title: 'New Arrival',
        productCount: '208 Product',
        categotyImage: AppImages.newArrival),
    CategotyModel(
        title: 'Clothes',
        productCount: '308 Product',
        categotyImage: AppImages.clothesCategory),
    CategotyModel(
        title: 'Bags',
        productCount: '160 Product',
        categotyImage: AppImages.bagesCategory),
    CategotyModel(
        title: 'Shoese',
        productCount: '230 Product',
        categotyImage: AppImages.shosesCategory),
    CategotyModel(
        title: 'watches',
        productCount: '80 Product',
        categotyImage: AppImages.watchesCategory),
  ];

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: CategoryListViewBody(categotymodel: categotymodel),
    );
  }
}
