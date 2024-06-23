import 'package:fashion_market/Features/home/presentation/manger/favorite_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fashion_market/Features/home/data/models/Api/product_model/product_model.dart';
import 'package:fashion_market/Features/home/presentation/views/product_details_view.dart';
import 'package:fashion_market/core/utils/app_styles.dart';
import 'package:gap/gap.dart';

class ProductItem extends StatefulWidget {
  const ProductItem({
    super.key,
    required this.productModel,
  });

  final ProductModel productModel;

  @override
  ProductItemState createState() => ProductItemState();
}

class ProductItemState extends State<ProductItem> {
  bool isFavorite = false;

  @override
  void initState() {
    super.initState();
    final favoritesCubit = context.read<FavoritesCubit>();
    isFavorite = favoritesCubit.state.contains(widget.productModel);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Stack(
          children: [
            GestureDetector(
              onTap: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (context) {
                  return ProductDetailsView(productModel: widget.productModel);
                },
              )),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: SizedBox(
                  height: 155,
                  width: 170,
                  child: Image.network(
                    widget.productModel.image,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return const Icon(Icons.error, size: 50);
                    },
                  ),
                ),
              ),
            ),
            Positioned(
              top: 5,
              right: 10,
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    isFavorite = !isFavorite;
                  });
                  final favoritesCubit = context.read<FavoritesCubit>();
                  if (isFavorite) {
                    favoritesCubit.addFavorite(widget.productModel);
                  } else {
                    favoritesCubit.removeFavorite(widget.productModel);
                  }
                },
                child: Icon(
                  Icons.favorite,
                  color: isFavorite ? Colors.red : Colors.grey,
                ),
              ),
            ),
          ],
        ),
        const Gap(11),
        Text(widget.productModel.name, style: AppStyles.styleSemiBold14),
        Text(
          widget.productModel.description,
          style: AppStyles.styleRegular11,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        Text('\$${widget.productModel.price.toString()}', style: AppStyles.styleSemiBold14),
      ],
    );
  }
}
