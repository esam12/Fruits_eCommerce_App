import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fruits/features/notification/domain/entity/notification_entity.dart';

class NotificationModel {
  final String id;
  final String image;
  final String title;
  final DateTime date;

  const NotificationModel({
    required this.id,
    required this.image,
    required this.title,
    required this.date,
  });

  factory NotificationModel.fromJson(Map<String, dynamic> json) {
    return NotificationModel(
      id: json['id'] ?? '',
      image: json['image'] ?? '',
      title: json['title'] ?? '',
      date: (json['date'] as Timestamp).toDate(),
    );
  }

  /// To JSON
  Map<String, dynamic> toJson() {
    return {
      'image': image,
      'title': title,
      'date': date,
    };
  }

  /// Convert to Entity
  NotificationEntity toEntity() {
    return NotificationEntity(
      id: id,
      image: image,
      title: title,
      date: date,
    );
  }
}
