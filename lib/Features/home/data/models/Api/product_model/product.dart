import 'package:equatable/equatable.dart';

class Product extends Equatable {
	final String id;
	final String name;
	final String description;
	final double price;
	final String image;
	final String category;
	final int numReviews;
	final int v;

	const Product({
		required this.id, 
		required this .name, 
		required this.description, 
		required this.price, 
		required this.image, 
		required this.category, 
		required this.numReviews,
		required this.v, 
	});

	factory Product.fromJson(Map<String, dynamic> json) => Product(
				id: json['_id'] as String,
				name: json['name'] as String,
				description: json['description'] as String,
				price: (json['price'] as num).toDouble(),
				image: json['image'] as String,
				category: json['category'] as String,
				numReviews: json['numReviews'] as int,
				v: json['__v'] as int,
			);

	Map<String, dynamic> toJson() => {
				'_id': id,
				'name': name,
				'description': description,
				'price': price,
				'image': image,
				'category': category,
				'numReviews': numReviews,
				
				'__v': v,
			};

	@override
	List<Object?> get props {
		return [
				id,
				name,
				description,
				price,
				image,
				category,
				numReviews,
				v,
		];
	}
}
