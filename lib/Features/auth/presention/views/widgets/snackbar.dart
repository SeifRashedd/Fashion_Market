import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class AuthSnackbar extends StatelessWidget {
  final String message;
  final bool isSuccess;

  const AuthSnackbar({
    super.key,
    required this.message,
    required this.isSuccess,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black54,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Container(
            padding: const EdgeInsets.all(30),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 10,
                  offset: Offset(0, 5),
                ),
              ],
            ),
            child: IntrinsicHeight(
              child: Column(
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        isSuccess ? Icons.check_circle : Icons.cancel,
                        color: isSuccess ? Colors.green : Colors.red,
                        size: 30.0,
                      ),
                      const SizedBox(width: 10),
                      Text(
                        maxLines: 3,
                        message,
                        style: const TextStyle(
                          fontSize: 16.0,
                          color: Colors.black87,
                        ),
                      ),
                    ],
                  ),
                  const Gap(10),
                  ElevatedButton(
                    onPressed: () {}, child: const Text('Close')),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

void showAuthSnackbar(BuildContext context, String message, bool isSuccess) {
  showDialog(
    context: context,
    builder: (context) => AuthSnackbar(
      message: message,
      isSuccess: isSuccess,
    ),
    barrierDismissible: true,
  );
}
