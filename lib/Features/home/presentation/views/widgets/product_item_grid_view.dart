import 'dart:developer';
import 'package:fashion_market/Features/home/presentation/manger/prodcuts_cubit/products_cubit.dart';
import 'package:fashion_market/Features/home/presentation/views/widgets/product_item.dart';
import 'package:fashion_market/core/widgets/custom_error_widget.dart';
import 'package:fashion_market/core/widgets/custom_loading_indi.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductItemGridView extends StatelessWidget {
  const ProductItemGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductsCubit, ProductslState>(
      builder: (context, state) {
        if (state is ProductsSuccess) {
          return GridView.builder(
            itemCount: state.products.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              childAspectRatio: .79,
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 20,
            ),
            itemBuilder: (context, index) {
              return ProductItem(
                productModel: state.products[index],
              );
            },
          );
        } else if (state is ProductsFailure) {
          log(state.errMsg);
          return CustomErrorWidget(errMessage: state.errMsg);
        } else {
          return const CustomLoadingIndicator();
        }
      },
    );
  }
}
