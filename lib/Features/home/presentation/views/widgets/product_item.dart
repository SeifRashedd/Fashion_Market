import 'package:fashion_market/Features/home/data/models/Api/product_model/product_model.dart';
import 'package:fashion_market/Features/home/presentation/views/product_details_view.dart';
import 'package:fashion_market/core/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class ProductItemHomeView extends StatefulWidget {
  const ProductItemHomeView({
    super.key,
    required this.productModel,
  });
  final ProductModel productModel;
  @override
  ProductItemHomeViewState createState() => ProductItemHomeViewState();
}

class ProductItemHomeViewState extends State<ProductItemHomeView> {
  bool isFavorite = false;

  ProductItemHomeViewState();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Stack(children: [
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
                child: Image.network(widget.productModel.image),
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
              },
              child: Icon(
                Icons.favorite,
                color: isFavorite ? Colors.red : Colors.grey,
              ),
            ),
          ),
        ]),
        const Gap(11),
        Text(widget.productModel.name, style: AppStyles.styleSemiBold14),
        Text(
          widget.productModel.description,
          style: AppStyles.styleRegular11,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        Text('\$${widget.productModel.price.toString()}',
            style: AppStyles.styleSemiBold14),
      ],
    );
  }
}
