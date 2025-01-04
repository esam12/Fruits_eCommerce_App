import 'package:fruits/core/entities/product_entity.dart';
import 'package:fruits/features/home/domain/entities/cart_item_entity.dart';

class CartEntity {
  final List<CartItemEntity> cartItems;

  CartEntity({required this.cartItems});

  addCartItem(CartItemEntity cartItemEntity) {
    cartItems.add(cartItemEntity);
  }

  /// Remove item from cart
  removeCartItem(CartItemEntity cartItemEntity) {
    cartItems.remove(cartItemEntity);
  }

  /// Check if item is already in cart
  bool isItemInCart(ProductEntity product) {
    for (var item in cartItems) {
      if (item.productEntity == product) {
        return true;
      }
    }
    return false;
    // if (cartItems.contains(product)) {
    //   return true;
    // } else {
    //   return false;
    // }
  }

  /// Calculate total price
  num calculateTotalPrice() {
    return cartItems.fold(
        0,
        (previousValue, element) =>
            previousValue + element.calculateTotalPrice());
  }

  /// Get item from cart
  CartItemEntity getItemFromCart(ProductEntity product) {
    return cartItems.firstWhere((element) => element.productEntity == product);
  }
}
