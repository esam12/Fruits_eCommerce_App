import 'package:fruits/core/entities/product_entity.dart';
import 'package:fruits/features/home/domain/entities/cart_item_entity.dart';

class OrderProductModel {
  final String name;
  final String code;
  final String imageUrl;
  final num price;
  final num quantity;

  OrderProductModel({
    required this.name,
    required this.code,
    required this.imageUrl,
    required this.price,
    required this.quantity,
  });

  factory OrderProductModel.fromEntity(
      {required CartItemEntity cartItemEntity}) {
    return OrderProductModel(
        name: cartItemEntity.productEntity.name,
        code: cartItemEntity.productEntity.code,
        imageUrl: cartItemEntity.productEntity.imageUrl!,
        price: cartItemEntity.productEntity.price,
        quantity: cartItemEntity.quantity);
  }

  // fromJson
  factory OrderProductModel.fromJson(Map<String, dynamic> json) {
    return OrderProductModel(
      name: json['name'] ?? '',
      code: json['code'] ?? '',
      imageUrl: json['imageUrl'] ?? '',
      price: json['price'] ?? 0,
      quantity: json['quantity'] ?? 0,
    );
  } 

  // toEntity
 CartItemEntity toEntity() {
    return CartItemEntity(
      productEntity: ProductEntity(
        name: name,
        price: price,
        code: code,
        description: '', // إذا ما عندك بيانات للوصف، حط قيمة افتراضية
        isFeatured: false,
        imageUrl: imageUrl,
        expirationsMonths: 0,
        numberOfCalories: 0,
        unitAmount: 0,
      ),
      quantity: quantity.toInt(),
    );
  }

  // toJson
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'code': code,
      'imageUrl': imageUrl,
      'price': price,
      'quantity': quantity,
    };
  }
}
