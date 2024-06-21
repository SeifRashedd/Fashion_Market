import 'package:fashion_market/Features/home/data/models/Api/product_model/product_model.dart';
import 'package:fashion_market/Features/home/presentation/views/widgets/product_item.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

class CategotyGridView extends StatelessWidget {
  const CategotyGridView({super.key, required this.products});
  final List<ProductModel> products;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: Hive.box('Favorites').listenable(),
      builder: (context, box, child) {
        return GridView.builder(
          itemCount: products.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: .79,
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 20,
          ),
          itemBuilder: (context, index) {
            return ProductItemHomeView(
                    productModel: products[index],
                  );
          },
        );
      },
    );
  }
}