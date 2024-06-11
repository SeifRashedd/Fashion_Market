import 'package:fashion_market/constants.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({
    super.key,
    required this.isSuccess,
  });

  final bool isSuccess;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        if (isSuccess) {
          Navigator.of(context).pop();
          GoRouter.of(context).push(kHomeView);
        } else {
          Navigator.of(context).pop();
        }
      },
      child: const Text('Close'),
    );
  }
}