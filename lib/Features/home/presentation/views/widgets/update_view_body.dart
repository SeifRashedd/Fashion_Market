import 'package:fashion_market/Features/auth/presention/views/widgets/custom_button.dart';
import 'package:fashion_market/Features/auth/presention/views/widgets/custom_form_text_failed.dart';
import 'package:fashion_market/Features/home/data/models/Api/product_model/product_model.dart';
import 'package:fashion_market/Features/home/presentation/manger/update/update_cubit.dart';
import 'package:fashion_market/Features/home/presentation/views/widgets/custom_app_bar.dart';
import 'package:fashion_market/constants.dart';
import 'package:fashion_market/core/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class UpdateViewBody extends StatefulWidget {
  const UpdateViewBody({super.key, required this.productModel});
  final ProductModel productModel;

  @override
  State<UpdateViewBody> createState() => UpdateViewBodyState();
}

class UpdateViewBodyState extends State<UpdateViewBody> {
  late TextEditingController nameController;
  late TextEditingController descriptionController;
  late TextEditingController imageController;
  late TextEditingController priceController;
  late TextEditingController numReviewsController;
  bool isLoding = false;

  String category = '';

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
  void initState() {
    super.initState();
    nameController = TextEditingController(text: widget.productModel.name);
    descriptionController =
        TextEditingController(text: widget.productModel.description);
    imageController = TextEditingController(text: widget.productModel.image);
    priceController =
        TextEditingController(text: widget.productModel.price.toString());
    numReviewsController =
        TextEditingController(text: widget.productModel.numReviews.toString());
    category = widget.productModel.category;
  }

  @override
  void dispose() {
    nameController.dispose();
    descriptionController.dispose();
    imageController.dispose();
    priceController.dispose();
    numReviewsController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: BlocConsumer<UpdateCubit, UpdateState>(
        listener: (context, state) {
          if (state is UpdateLoading) {
            isLoding = true;
          } else if (state is UpdateSuccess) {
            showSnackBar(context, 'Product updated successfully!',
                isError: false);
            GoRouter.of(context).push(kHomeView);
          } else if (state is UpdateFailure) {
            showSnackBar(context, state.errMsg, isError: true);
            isLoding = false;
          }
        },
        builder: (context, state) {
          return ModalProgressHUD(
            inAsyncCall: isLoding,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Form(
                child: ListView(
                  children: [
                    const CustomAppBar(),
                    const Gap(30),
                    Center(
                      child: Text(
                        'Update your product',
                        style: AppStyles.styleBold18,
                      ),
                    ),
                    const Gap(30),
                    Center(
                      child: Column(
                        children: [
                          DropdownButton<String>(
                            value:
                                categories.contains(category) ? category : null,
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
                        ],
                      ),
                    ),
                    const Gap(10),
                    CustomFormTextField(
                      controller: nameController,
                      onChange: (data) {
                        setState(() {
                          widget.productModel.name = data;
                        });
                      },
                    ),
                    const Gap(30),
                    CustomFormTextField(
                      controller: descriptionController,
                      onChange: (data) {
                        setState(() {
                          widget.productModel.description = data;
                        });
                      },
                      hintText: 'Type the product description',
                    ),
                    const Gap(30),
                    CustomFormTextField(
                      controller: priceController,
                      onChange: (data) {
                        setState(() {
                          widget.productModel.price =
                              double.tryParse(data) ?? 0.0;
                        });
                      },
                      hintText: 'Type the product price',
                    ),
                    const Gap(30),
                    CustomFormTextField(
                      controller: imageController,
                      onChange: (data) {
                        setState(() {
                          widget.productModel.image = data;
                        });
                      },
                      hintText: 'Put the image of the product',
                    ),
                    const Gap(30),
                    CustomButton(
                      onTap: () {
                        context.read<UpdateCubit>().updateProduct(
                              id: widget.productModel.id,
                              name: widget.productModel.name,
                              price: widget.productModel.price.toDouble(),
                              description: widget.productModel.description,
                              image: widget.productModel.image,
                              category: category,
                            );
                      },
                      text: 'Update the product',
                    ),
                    const Gap(30),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    ));
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