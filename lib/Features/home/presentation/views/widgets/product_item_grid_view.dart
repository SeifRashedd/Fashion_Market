
import 'package:fashion_market/Features/home/presentation/views/widgets/product_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:hive_flutter/adapters.dart';

class ProductItemGridView extends StatelessWidget {
  const ProductItemGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: Hive.box('Favorites').listenable(),
      builder: (context , box , child)
      {
       return GridView.builder(
        itemCount: 10,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: .79,
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 20,
        ),
        itemBuilder: (context, index) {
          return const ProductItemHomeView();
        },
      );
      },
    );
  }
}