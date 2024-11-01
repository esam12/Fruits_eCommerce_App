import 'package:fruits/core/entities/product_entity.dart';
import 'package:fruits/core/models/review_model.dart';

class ProductModel {
  final String name;
  final num price;
  final String code;
  final String description;
  final bool isFeatured;
  String? imageUrl;
  final int expirationsMonths;
  final bool isOrganic;
  final int numberOfCalories;
  final int unitAmount;
  final num averageRating;
  final num ratingCount;
  final int sellingCount;
  final List<ReviewModel> reviews;

  ProductModel({
    required this.name,
    required this.price,
    required this.code,
    required this.description,
    required this.isFeatured,
    this.imageUrl,
    required this.expirationsMonths,
    this.isOrganic = false,
    required this.numberOfCalories,
    required this.unitAmount,
    this.averageRating = 0,
    this.ratingCount = 0,
    this.sellingCount = 0,
    this.reviews = const [],
  });

  // Empty constructor
  ProductModel.empty()
      : name = '',
        price = 0,
        code = '',
        description = '',
        isFeatured = false,
        imageUrl = '',
        expirationsMonths = 0,
        isOrganic = false,
        numberOfCalories = 0,
        unitAmount = 0,
        averageRating = 0,
        ratingCount = 0,
        sellingCount = 0,
        reviews = const [];

  ProductEntity toEntity() {
    return ProductEntity(
      name: name,
      price: price,
      code: code,
      description: description,
      isFeatured: isFeatured,
      imageUrl: imageUrl,
      expirationsMonths: expirationsMonths,
      isOrganic: isOrganic,
      numberOfCalories: numberOfCalories,
      unitAmount: unitAmount,
      averageRating: averageRating,
      ratingCount: ratingCount,
      reviews: reviews.map((e) => e.toEntity()).toList(),
    );
  }

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      name: json['name'],
      price: json['price'],
      code: json['code'],
      description: json['description'],
      isFeatured: json['isFeatured'],
      imageUrl: json['imageUrl'],
      expirationsMonths: json['expirationsMonths'],
      isOrganic: json['isOrganic'],
      numberOfCalories: json['numberOfCalories'],
      unitAmount: json['unitAmount'],
      reviews: List<ReviewModel>.from(
          json['reviews'].map((x) => ReviewModel.fromJson(x))),
      averageRating: json['averageRating'],
      ratingCount: json['ratingCount'],
      sellingCount: json['sellingCount'],
    );
  }

  toJson() {
    return {
      'name': name,
      'price': price,
      'code': code,
      'description': description,
      'isFeatured': isFeatured,
      'imageUrl': imageUrl,
      'expirationsMonths': expirationsMonths,
      'isOrganic': isOrganic,
      'numberOfCalories': numberOfCalories,
      'unitAmount': unitAmount,
      ''
          'reviews': reviews.map((e) => e.toJson()).toList(),
    };
  }
}
