import 'package:fashion_market/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class PromoCard extends StatelessWidget {
  final Image image;
  final String discountText;
  final String descriptionText;
  final String codeText;

  const PromoCard({
    super.key,
    required this.image,
    required this.discountText,
    required this.descriptionText,
    required this.codeText,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Container(
        height: 150,
        width: 300,
        color: const Color(0xffDCDCDC),
        child: Stack(
          children: [
            Positioned(right: 0, child: image),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(discountText, style: AppStyles.styleBold25),
                  const SizedBox(height: 8),
                  Text(
                    descriptionText,
                    style: AppStyles.styleRegular16,
                  ),
                  const SizedBox(height: 8),
                  Text(codeText, style: AppStyles.styleSemiBold11),
                  const SizedBox(height: 16),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
