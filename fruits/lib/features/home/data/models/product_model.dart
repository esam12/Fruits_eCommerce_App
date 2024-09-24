// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fruits/features/home/domain/entities/home_entity.dart';

class ProductModel extends ProductEntity {
  String id;
  String name;
  String image;
  num price;
  String? description;
  num? rating;
  num? ratingCount;
  num? calories;

  ProductModel({
    required this.id,
    required this.name,
    required this.image,
    required this.price,
    this.description,
    this.rating,
    this.ratingCount,
    this.calories,
  }) : super(
          productId: id,
          productName: name,
          productPrice: price,
          productImage: image,
          productDescription: description,
          productRating: rating,
          productRatingCount: ratingCount,
          productCalories: calories,
        );

  // Create an empty product model
  static ProductModel empty() {
    return ProductModel(
      id: '',
      name: '',
      image: '',
      price: 0.0,
      description: '',
      rating: 0.0,
      ratingCount: 0.0,
      calories: 0.0,
    );
  }

  /// Json Format
  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'image': image,
      'price': price,
      'description': description,
      'rating': rating,
      'ratingCount': ratingCount,
      'calories': calories,
    };
  }

  /// From
  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'],
      name: json['name'],
      image: json['image'],
      price: json['price'],
      description: json['description'],
      rating: json['rating'],
      ratingCount: json['ratingCount'],
      calories: json['calories'],
    );
  }

  // Map json oriented document snapshot from Firebase to model
  factory ProductModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() == null) return ProductModel.empty();
    final data = document.data()!;

    return ProductModel(
      id: document.id,
      name: data['name'],
      image: data['image'],
      price: data['price'],
      description: data['description'],
      rating: data['rating'],
      ratingCount: data['ratingCount'],
      calories: data['calories'],
    );
  }
}
