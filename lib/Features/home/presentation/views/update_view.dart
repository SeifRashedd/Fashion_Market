import 'package:fashion_market/Features/home/data/models/Api/product_model/product_model.dart';
import 'package:fashion_market/Features/home/presentation/manger/update/update_cubit.dart';
import 'package:fashion_market/Features/home/presentation/views/widgets/update_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UpdateView extends StatelessWidget {
  final ProductModel productModel;

  const UpdateView({super.key, required this.productModel});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UpdateCubit(),
      child: UpdateViewBody(productModel: productModel),
    );
  }
}
