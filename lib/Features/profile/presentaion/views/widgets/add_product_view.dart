import 'package:fashion_market/Features/auth/presention/views/widgets/custom_button.dart';
import 'package:fashion_market/Features/auth/presention/views/widgets/custom_form_text_failed.dart';
import 'package:fashion_market/Features/home/presentation/views/widgets/custom_app_bar.dart';
import 'package:fashion_market/Features/profile/presentaion/views/manger/add_product_cubit/add_product_cubit.dart';
import 'package:fashion_market/constants.dart';
import 'package:fashion_market/core/utils/app_styles.dart';
import 'package:fashion_market/core/widgets/custom_loading_indi.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

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
        child: BlocConsumer<AddProductCubit, AddProductCubitState>(
          listener: (context, state) {
            if (state is AddProductCubitSuccess) {
              showSnackBar(context, 'Product added successfully!',
                  isError: false);
              GoRouter.of(context).push(kHomeView);
            } else if (state is AddProductCubitFailure) {
              showSnackBar(context, state.errMsg, isError: true);
            }
          },
          builder: (context, state) {
            if (state is AddProductCubitLoading) {
              return const CustomLoadingIndicator();
            } else {
              return Padding(
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
                      hintText: 'Type the product name',
                    ),
                    const Gap(30),
                    CustomFormTextField(
                      onChange: (data) {
                        setState(() {
                          description = data;
                        });
                      },
                      hintText: 'Type the product description',
                    ),
                    const Gap(30),
                    CustomFormTextField(
                      onChange: (data) {
                        setState(() {
                          price = double.tryParse(data) ?? 0.0;
                        });
                      },
                      hintText: 'Type the product price',
                    ),
                    const Gap(30),
                    CustomFormTextField(
                      onChange: (data) {
                        setState(() {
                          image = data;
                        });
                      },
                      hintText: 'Put the image of the product',
                    ),
                    const Gap(30),
                    CustomFormTextField(
                      onChange: (data) {
                        setState(() {
                          numReviews = int.tryParse(data) ?? 0;
                        });
                      },
                      hintText: 'Type the number of reviews of the product',
                    ),
                    const Gap(30),
                    CustomButton(
                      onTap: () {
                        context.read<AddProductCubit>().addProduct(
                              name: name,
                              description: description,
                              price: price,
                              category: category,
                              image: image,
                              numReviews: numReviews,
                            );
                      },
                      text: 'Add the product',
                    ),
                    const Gap(30),
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
