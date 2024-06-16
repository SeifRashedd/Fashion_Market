import 'package:equatable/equatable.dart';
import 'product.dart';

class ProductModel extends Equatable {
  final int? count;
  final List<Product>? products;

  const ProductModel({this.count, this.products});

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        count: json['count'] as int?,
        products: (json['products'] as List<dynamic>?)
            ?.map((e) => Product.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'count': count,
        'products': products?.map((e) => e.toJson()).toList(),
      };

  @override
  List<Object?> get props => [count, products];
}
