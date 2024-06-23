import 'package:fashion_market/Features/home/data/models/Api/product_model/product_model.dart';
import 'package:fashion_market/Features/home/presentation/views/widgets/product_item.dart';
import 'package:flutter/material.dart';

class CategotyGridView extends StatelessWidget {
  const CategotyGridView({super.key, required this.products});
  final List<ProductModel> products;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
          itemCount: products.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: .79,
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 20,
          ),
          itemBuilder: (context, index) {
            return ProductItem(
              productModel: products[index],
            );
          },
        );
  }
}
