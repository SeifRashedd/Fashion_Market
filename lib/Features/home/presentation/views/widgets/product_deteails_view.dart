import 'package:fashion_market/core/utils/app_images.dart';
import 'package:fashion_market/core/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class ProductDetailsView extends StatefulWidget {
  const ProductDetailsView({super.key});

  @override
  ProductDetailsViewState createState() => ProductDetailsViewState();
}

class ProductDetailsViewState extends State<ProductDetailsView> {
  int quantity = 1;

  void incrementQuantity() {
    setState(() {
      quantity++;
    });
  }

  void _decrementQuantity() {
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
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const ProductDetailsViewAppBar(),
              const Gap(20),
              Center(child: AppImages.productItem),
              const Gap(16),
              Text(
                'Roller Rabbit',
                style: AppStyles.styleBold18,
              ),
              Text('Vado Odelle Dress', style: AppStyles.styleRegular11),
              Row(
                children: [
                  const Icon(Icons.star, color: Colors.yellow),
                  const Icon(Icons.star, color: Colors.yellow),
                  const Icon(Icons.star, color: Colors.yellow),
                  const Icon(Icons.star, color: Colors.yellow),
                  const Icon(Icons.star, color: Colors.yellow),
                  const Gap(8),
                  Text(
                    '(320 Reviews)',
                    style: AppStyles.styleRegular11,
                  ),
                ],
              ),
              const Gap(30),
              Text(
                'Description',
                style: AppStyles.styleSemiBold16,
              ),
              const Gap(8),
              Text(
                'Get a little lift from these Sam Edelman sandals featuring ruched straps and leather lace-up ties, while a braided jute sole makes a fresh statement for summer.',
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
                    '\$198.00',
                    style: AppStyles.styleRegular16,
                  ),
                ],
              ),
              const Gap(16),
              Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.remove),
                    onPressed: _decrementQuantity,
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
            ],
          ),
        ),
      ),
    );
  }
}

class ProductDetailsViewAppBar extends StatelessWidget {
  const ProductDetailsViewAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
            onTap: () => Navigator.pop(context), child: AppImages.backarrow),
        const Gap(60),
        Text('Product Details',
            style: AppStyles.styleSemiBold20.copyWith(color: Colors.black)),
      ],
    );
  }
}
