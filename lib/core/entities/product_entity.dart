import 'package:fruits/core/entities/review_entity.dart';

class ProductEntity {
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
  final List<ReviewEntity> reviews;

  ProductEntity({
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
    this.reviews = const [],
  });
}
