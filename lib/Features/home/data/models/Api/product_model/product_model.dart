import 'package:equatable/equatable.dart';

import 'product.dart';

class ProductModel extends Equatable {
	final List<Product>? products;

	const ProductModel({this.products});

	factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
				products: (json['products'] as List<dynamic>?)
						?.map((e) => Product.fromJson(e as Map<String, dynamic>))
						.toList(),
			);

	Map<String, dynamic> toJson() => {
				'products': products?.map((e) => e.toJson()).toList(),
			};

	@override
	List<Object?> get props => [products];
}
