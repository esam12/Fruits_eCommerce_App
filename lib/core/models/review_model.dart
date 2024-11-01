import 'package:fruits/core/entities/review_entity.dart';

class ReviewModel {
  final String name;
  final String image;
  final num rating;
  final String comment;
  final String date;

  ReviewModel({
    required this.name,
    required this.image,
    required this.rating,
    required this.comment,
    required this.date,
  });

  factory ReviewModel.fromEntity(ReviewEntity entity) {
    return ReviewModel(
      name: entity.name,
      image: entity.image,
      rating: entity.rating,
      comment: entity.comment,
      date: entity.date,
    );
  }

  factory ReviewModel.fromJson(Map<String, dynamic> json) {
    return ReviewModel(
      name: json['name'],
      image: json['image'],
      rating: json['rating'],
      comment: json['comment'],
      date: json['date'],
    );
  }

  ReviewEntity toEntity() {
    return ReviewEntity(
      name: name,
      image: image,
      rating: rating,
      comment: comment,
      date: date,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'image': image,
      'rating': rating,
      'comment': comment,
      'date': date,
    };
  }
}
