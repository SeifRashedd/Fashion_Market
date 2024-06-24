import 'package:fashion_market/Features/auth/presention/views/widgets/custom_button.dart';
import 'package:fashion_market/Features/auth/presention/views/widgets/custom_form_text_failed.dart';
import 'package:fashion_market/Features/home/presentation/views/widgets/custom_app_bar.dart';
import 'package:fashion_market/core/utils/api_service.dart';
import 'package:fashion_market/core/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class AddProductView extends StatefulWidget {
  const AddProductView({super.key});

  @override
  State<AddProductView> createState() => AddProductViewState();
}

class AddProductViewState extends State<AddProductView> {
  String name = '';
  String description = '';
  String image = '';
  String category = '';
  int numReviews = 0;
  double price = 0.0;

  final List<String> categories = [
    'New Arrival',
    'Bag',
    'Shose',
    'Watch',
    'Clothes'
  ];

  final Map<String, String> categoryMap = {
    'New Arrival': 'new arrival',
    'Bag': 'bages',
    'Shose': 'shose',
    'Watch': 'watches',
    'Clothes': 'clothes'
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: ListView(
            children: [
              const CustomAppBar(),
              const Gap(30),
              Center(
                child: Text(
                  'Add New Product',
                  style: AppStyles.styleBold18,
                ),
              ),
              const Gap(30),
              Center(
                child: DropdownButton<String>(
                  value: categories.contains(category) ? category : null,
                  hint: Text(
                    category.isEmpty
                        ? 'Choose a category'
                        : 'Chosen category: ${categoryMap.keys.firstWhere(
                            (key) => categoryMap[key] == category,
                          )}',
                  ),
                  items: categories.map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (newValue) {
                    setState(() {
                      category = categoryMap[newValue!]!;
                    });
                  },
                ),
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
              const Gap(30),
              CustomFormTextField(
                onChange: (data) {
                  setState(() {
                    description = data;
                  });
                },
                hintText: 'type the description of the product',
              ),
              const Gap(30),
              CustomFormTextField(
                onChange: (data) {
                  setState(() {
                    price = double.tryParse(data) ?? 0.0;
                  });
                },
                hintText: 'type the price of the product',
              ),
              const Gap(30),
              CustomFormTextField(
                onChange: (data) {
                  setState(() {
                    image = data;
                  });
                },
                hintText: 'put the image of the product',
              ),
              const Gap(30),
              CustomFormTextField(
                onChange: (data) {
                  setState(() {
                    numReviews = int.tryParse(data) ?? 0;
                  });
                },
                hintText: 'type the number of reviews of the product',
              ),
              const Gap(30),
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
              const Gap(30),
            ],
          ),
        ),
      ),
    );
  }
}
