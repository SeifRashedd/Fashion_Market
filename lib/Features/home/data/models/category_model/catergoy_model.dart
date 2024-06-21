import 'package:flutter/material.dart';

class CategotyModel {
  final String title;
  final String productCount;
  final Image categotyImage;
  final String kname;

  CategotyModel(
      {required this.kname,
      required this.title,
      required this.productCount,
      required this.categotyImage});
}
