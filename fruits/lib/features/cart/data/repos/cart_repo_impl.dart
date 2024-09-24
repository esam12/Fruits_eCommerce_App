import 'dart:convert';

import 'package:fruits/core/services/shared_preferences_singleton.dart';
import 'package:fruits/features/cart/data/models/cart_model.dart';
import 'package:fruits/features/cart/domain/repos/cart_repo.dart';

class CartRepoImpl extends CartRepo {
  int noOfCartItems = 0;
  double totalCartPrice = 0.0;
  List<CartModel> cartItems = [];
  @override
  Future<void> addToCart(CartModel cartModel) async {
    final cartItems = await getCartItems();

    final existingItemIndex =
        cartItems.indexWhere((item) => item.id == cartModel.id);

    if (existingItemIndex != -1) {
      // If the item already exists, update its quantity
      cartItems[existingItemIndex] = cartItems[existingItemIndex].copyWith(
        quantity: cartItems[existingItemIndex].quantity + cartModel.quantity,
      );
    } else {
      // Otherwise, add the new item to the cart
      cartItems.add(cartModel);
    }

    await SharedPreferencesSingleton.setStringList(
      'cartItems',
      cartItems.map((item) => json.encode(item.toJson())).toList(),
    );
  }

  @override
  Future<List<CartModel>> getCartItems() {
    throw UnimplementedError();
  }

  @override
  Future<void> removeFromCart(int id) {
    throw UnimplementedError();
  }

  @override
  Future<void> clearCart() {
    throw UnimplementedError();
  }

  @override
  Future<void> updateItemQuantity(String itemId, int quantity) {
    throw UnimplementedError();
  }
}
