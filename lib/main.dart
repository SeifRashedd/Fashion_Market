import 'package:flutter/material.dart';
import 'Features/splash/presentation/views/widgets/splash_view.dart';

void main() {
  runApp(const FashionMarcket());
}

class FashionMarcket extends StatelessWidget {
  const FashionMarcket({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashView(),
    );
  }
}
