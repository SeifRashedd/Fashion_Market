import 'package:equatable/equatable.dart';

class Product extends Equatable {
  final String? id;
  final String? name;
  final String? description;
  final double? price;
  final String? image;
  final String? category;
  final int? numReviews;
 
  

  const Product({
    this.id,
    this.name,
    this.description,
    this.price,
    this.image,
    this.category,
    this.numReviews,
    
    
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json['_id'] as String?,
        name: json['name'] as String?,
        description: json['description'] as String?,
        price: (json['price'] as num?)?.toDouble(),
        image: json['image'] as String?,
        category: json['category'] as String?,
        numReviews: json['numReviews'] as int?,
       
       
      );

  Map<String, dynamic> toJson() => {
        '_id': id,
        'name': name,
        'description': description,
        'price': price,
        'image': image,
        'category': category,
        'numReviews': numReviews,
       
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
      
    ];
  }
}
