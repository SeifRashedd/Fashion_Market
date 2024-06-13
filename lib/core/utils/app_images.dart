import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

abstract class AppImages {
  static Image logoImage = Image.asset('assets/images/fashionmarcketlogo.jpeg');
  static SvgPicture menueImage = SvgPicture.asset('assets/images/menu.svg');
  static Image promoCodeImage1 = Image.asset('assets/images/promocode1.png');
  static Image promoCodeImage2 = Image.asset('assets/images/promoCode2.png');
  static Image productItem = Image.asset(
    'assets/images/prductitem.png',
    fit: BoxFit.cover,
  );
  static Image loveIcon = Image.asset(
    'assets/images/love.png',
  );
  static SvgPicture backarrow = SvgPicture.asset('assets/images/backArrow.svg');

  static SvgPicture cart = SvgPicture.asset('assets/images/carticon.svg');
  static Image newArrival = Image.asset('assets/images/newarrivalimage.png');
  static Image clothesCategory =
      Image.asset('assets/images/clothescategory.png');
  static Image shosesCategory = Image.asset('assets/images/shosesCategry.png');
  static Image bagesCategory = Image.asset('assets/images/bagsCategory.png');
  static Image watchesCategory =
      Image.asset('assets/images/watchesCatrgory.png');
}
