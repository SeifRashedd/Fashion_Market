import 'package:fashion_market/Features/home/data/models/category_model/catergoy_model.dart';
import 'package:fashion_market/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class CategoryListViewBody extends StatelessWidget {
  const CategoryListViewBody({
    super.key,
    required this.categotymodel,
  });

  final List<CategotyModel> categotymodel;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: categotymodel.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(top: 20),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Container(
              color: Colors.white,
              height: 120,
              width: 400,
              child: Stack(
                children: [
                  Positioned(
                    left: 0,
                    top: -40,
                    right: 0,
                    child: categotymodel[index].categotyImage,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          categotymodel[index].title,
                          style: AppStyles.styleBold18,
                        ),
                        Text(
                          categotymodel[index].productCount,
                          style: AppStyles.styleRegular16
                              .copyWith(color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
