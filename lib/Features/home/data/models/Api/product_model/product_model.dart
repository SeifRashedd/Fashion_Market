import 'package:equatable/equatable.dart';

class ProductModel extends Equatable {
  final String id;
  final String name;
  final String description;
  final num price;
  final String image;
  final String category;
  final int numReviews;
  final String createdAt;
  final String updatedAt;

  const ProductModel({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.image,
    required this.category,
    required this.numReviews,
    required this.createdAt,
    required this.updatedAt,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['_id'],
      name: json['name'],
      description: json['description'],
      price: json['price'],
      image: json['image'],
      category: json['category'],
      numReviews: json['numReviews'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt']
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'description':description,
    'price':price,
    'image':image,
    'category': category,
    'numReviews':numReviews,
    'createdAt':createdAt,
    'updatedAt':updatedAt
  };

  @override
  List<Object?> get props => [id, name,description,price,image,category,numReviews,createdAt,updatedAt ];
}