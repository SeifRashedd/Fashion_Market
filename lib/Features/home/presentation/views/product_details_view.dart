import 'package:fashion_market/Features/auth/presention/views/widgets/custom_button.dart';
import 'package:fashion_market/Features/home/data/models/Api/product_model/product_model.dart';
import 'package:fashion_market/Features/home/presentation/manger/delete_product_cubit/deleteproduct_cubit.dart';
import 'package:fashion_market/Features/home/presentation/views/widgets/product_details_view_app_bar.dart';
import 'package:fashion_market/constants.dart';
import 'package:fashion_market/core/utils/app_images.dart';
import 'package:fashion_market/core/utils/app_styles.dart';
import 'package:fashion_market/core/widgets/custom_loading_indi.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class ProductDetailsView extends StatefulWidget {
  const ProductDetailsView({super.key, required this.productModel});

  @override
  ProductDetailsViewState createState() => ProductDetailsViewState();
  final ProductModel productModel;
}

class ProductDetailsViewState extends State<ProductDetailsView> {
  int quantity = 1;

  void incrementQuantity() {
    setState(() {
      quantity++;
    });
  }

  void decrementQuantity() {
    setState(() {
      if (quantity > 1) {
        quantity--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocConsumer<DeleteproductCubit, DeleteproductState>(
          listener: (context, state) {
            if (state is DeleteProductSuccess) {
              showSnackBar(context, 'Product deleted successfully!',
                  isError: false);
              GoRouter.of(context).push(kHomeView);
            } else if (state is DeleteproductFailure) {
              showSnackBar(context, state.errMsg, isError: true);
            }
          },
          builder: (context, state) {
            if (state is DeleteproductLoading) {
              return const CustomLoadingIndicator();
            } else {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const ProductDetailsViewAppBar(),
                    const Gap(20),
                    Positioned(
                      left: 0,
                      right: 0,
                      child: SizedBox(
                          height: 300,
                          width: double.infinity,
                          child: Image.network(
                            widget.productModel.image,
                            alignment: Alignment.topCenter,
                          )),
                    ),
                    const Gap(16),
                    Text(
                      widget.productModel.name,
                      style: AppStyles.styleBold18,
                    ),
                    Row(
                      children: [
                        const Icon(Icons.star, color: Colors.yellow),
                        const Icon(Icons.star, color: Colors.yellow),
                        const Icon(Icons.star, color: Colors.yellow),
                        const Icon(Icons.star, color: Colors.yellow),
                        const Icon(Icons.star, color: Colors.yellow),
                        const Gap(8),
                        Text(
                          widget.productModel.numReviews.toString(),
                          style: AppStyles.styleRegular11,
                        ),
                      ],
                    ),
                    const Gap(15),
                    Text(
                      'Description',
                      style: AppStyles.styleSemiBold16,
                    ),
                    const Gap(8),
                    Text(
                      widget.productModel.description,
                      overflow: TextOverflow.ellipsis,
                      style: AppStyles.styleRegular11,
                    ),
                    const Gap(16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Total Price',
                          style: AppStyles.styleSemiBold16,
                        ),
                        Text(
                          '\$${widget.productModel.price.toString()}',
                          style: AppStyles.styleRegular16,
                        ),
                      ],
                    ),
                    const Gap(16),
                    Row(
                      children: [
                        IconButton(
                          icon: const Icon(Icons.remove),
                          onPressed: decrementQuantity,
                        ),
                        Text('$quantity'),
                        IconButton(
                          icon: const Icon(Icons.add),
                          onPressed: incrementQuantity,
                        ),
                        const Spacer(),
                        AppImages.addToCart
                      ],
                    ),
                    const Gap(40),
                    CustomButton(
                      onTap: () {
                        GoRouter.of(context).push(kUpdateView);
                      },
                      text: 'update the product',
                    ),
                    const Gap(20),
                    CustomButton(
                      onTap: () {
                        context
                            .read<DeleteproductCubit>()
                            .deleteProduct(productId: widget.productModel.id);
                      },
                      text: 'delete the product',
                    ),
                  ],
                ),
              );
            }
          },
        ),
      ),
    );
  }
}

void showSnackBar(BuildContext context, String message,
    {bool isError = false}) {
  final snackBar = SnackBar(
    content: Text(message),
    backgroundColor: isError ? Colors.red : Colors.green,
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
