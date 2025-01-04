import 'package:fruits/core/entities/product_entity.dart';
import 'package:fruits/features/home/domain/entities/cart_item_entity.dart';

class CartEntity {
  final List<CartItemEntity> cartItems;

  CartEntity({required this.cartItems});

  addCartItem(CartItemEntity cartItemEntity) {
    cartItems.add(cartItemEntity);
  }

  /// Check if item is already in cart
  bool isItemInCart(ProductEntity product) {
    if (cartItems.contains(product)) {
      return true;
    } else {
      return false;
    }
  }

  /// Calculate total price
  num calculateTotalPrice() {
    return cartItems.fold(0, (previousValue, element) => previousValue + element.calculateTotalPrice());
  }

  /// Get item from cart
  CartItemEntity getItemFromCart(ProductEntity product) {
    return cartItems.firstWhere((element) => element.productEntity == product);
  }
}
