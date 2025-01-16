import 'package:equatable/equatable.dart';
import 'package:fruits/core/entities/product_entity.dart';

class CartItemEntity extends Equatable {
  final ProductEntity productEntity;
  int quantity;

  CartItemEntity({
    required this.productEntity,
    this.quantity = 1,
  });

  /// Calculate total price
  num calculateTotalPrice() {
    return productEntity.price * quantity;
  }

  /// Calculate total weight
  num calculateTotalWeight() {
    return productEntity.unitAmount * quantity;
  }

  /// Increment quantity
  void incrementQuantity() {
    quantity++;
  }

  /// Decrement quantity
  void decrementQuantity() {
    quantity--;
  }

  @override
  List<Object?> get props => [productEntity];
}
