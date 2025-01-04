import 'package:fruits/core/entities/product_entity.dart';

class CartItemEntity {
  final ProductEntity productEntity;
  int count;

  CartItemEntity({
    required this.productEntity,
    this.count = 1,
  });

  /// Calculate total price
  num calculateTotalPrice() {
    return productEntity.price * count;
  }

  /// Calculate total weight
  num calculateTotalWeight() {
    return productEntity.unitAmount * count;
  }

  /// Increment count
  void incrementCount() {
    count++;
  }

  /// Decrement count
  void decrementCount() {
    count--;
  }
}
