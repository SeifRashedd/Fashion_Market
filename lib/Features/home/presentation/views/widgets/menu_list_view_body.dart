import 'package:fashion_market/Features/home/data/models/category_model/catergoy_model.dart';
import 'package:fashion_market/Features/home/presentation/manger/prodcuts_cubit/products_cubit.dart';
import 'package:fashion_market/Features/home/presentation/views/widgets/menu_item_view.dart';
import 'package:fashion_market/core/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MenuListViewBody extends StatelessWidget {
  const MenuListViewBody({
    super.key,
    required this.categotyModel,
  });

  final List<CategotyModel> categotyModel;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: categotyModel.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(top: 20),
          child: GestureDetector(
            onTap: () => _onCategoryTap(context, categotyModel[index].kname),
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
                      child: categotyModel[index].categotyImage,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            categotyModel[index].title,
                            style: AppStyles.styleBold18,
                          ),
                          Text(
                            categotyModel[index].productCount,
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
          ),
        );
      },
    );
  }

  void _onCategoryTap(BuildContext context, String categoryName) async {
    final productsCubit = BlocProvider.of<ProductsCubit>(context);
    await productsCubit.fetchProducts(categoryName: categoryName);

    if (!context.mounted) return;

    if (productsCubit.state is ProductsSuccess) {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => MenuItemView(
            productlist: (productsCubit.state as ProductsSuccess).products,
          ),
        ),
      );
    }
  }
}
