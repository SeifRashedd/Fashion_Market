import 'package:fashion_market/Features/auth/presention/views/widgets/custom_button.dart';
import 'package:fashion_market/Features/auth/presention/views/widgets/custom_form_text_failed.dart';
import 'package:fashion_market/core/utils/api_service.dart';
import 'package:fashion_market/core/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class ShowModelSheet extends StatefulWidget {
  const ShowModelSheet({super.key});

  @override
  ShowModelSheetState createState() => ShowModelSheetState();
}

class ShowModelSheetState extends State<ShowModelSheet> {
  String name = '';
  String description = '';
  String image = '';
  String category = '';
  int numReviews = 0;
  double price = 0.0;

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: ListView(
          children: [
            Text(
              'Add New Product',
              style: AppStyles.styleBold18,
            ),
            const Gap(10),
            CustomFormTextField(
              onChange: (data) {
                setState(() {
                  name = data;
                });
              },
              hintText: 'type the name of the product',
            ),
            const Gap(10),
            CustomFormTextField(
              onChange: (data) {
                setState(() {
                  description = data;
                });
              },
              hintText: 'type the description of the product',
            ),
            const Gap(10),
            CustomFormTextField(
              onChange: (data) {
                setState(() {
                  price = double.tryParse(data) ?? 0.0;
                });
              },
              hintText: 'type the price of the product',
            ),
            const Gap(10),
            CustomFormTextField(
              onChange: (data) {
                setState(() {
                  category = data;
                });
              },
              hintText: 'put the category of the product',
            ),
            const Gap(10),
            CustomFormTextField(
              onChange: (data) {
                setState(() {
                  image = data;
                });
              },
              hintText: 'put the image of the product',
            ),
            const Gap(10),
            CustomFormTextField(
              onChange: (data) {
                setState(() {
                  numReviews = int.tryParse(data) ?? 0;
                });
              },
              hintText: 'type the number of reviews of the product',
            ),
            const Gap(10),
            CustomButton(
              onTap: () {
                AddProduct().addProduct(
                    name: name,
                    description: description,
                    price: price,
                    category: category,
                    image: image,
                    numReviews: numReviews);
              },
              text: 'Add the product',
            ),
            const Gap(10),
          ],
        ),
      ),
    );
  }
}
