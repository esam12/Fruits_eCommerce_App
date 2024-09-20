import 'package:fruits/features/cart/data/models/cart_model.dart';

abstract class CartRepo {
  /// Add item to cart
  Future<void> addToCart(CartModel cartModel);

  /// Remove item from cart
  Future<void> removeFromCart(int id);

  /// Get cart items
  Future<List<CartModel>> getCartItems();

  /// Update item quantity
  Future<void> updateItemQuantity(String itemId, int quantity);

  /// Clear cart
  Future<void> clearCart();
}
