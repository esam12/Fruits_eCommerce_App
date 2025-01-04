import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits/core/entities/product_entity.dart';
import 'package:fruits/features/home/domain/entities/cart_entity.dart';
import 'package:fruits/features/home/domain/entities/cart_item_entity.dart';
import 'package:meta/meta.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());

  CartEntity cartEntity = CartEntity(cartItems: []);

  void addCartItem(ProductEntity productEntity) {
    // check if item is already in cart
    bool isItemInCart = cartEntity.isItemInCart(productEntity);

    if (isItemInCart) {
      // if item is in cart, increment count
      CartItemEntity cartItemEntity = cartEntity.getItemFromCart(productEntity);
      cartItemEntity.incrementCount();
    } else {
      CartItemEntity cartItemEntity = CartItemEntity(
        productEntity: productEntity,
        count: 1,
      );
      cartEntity.addCartItem(cartItemEntity);
    }

    emit(CartItemAdded());
  }

  void removeCartItem(CartItemEntity cartItemEntity) {
    cartEntity.removeCartItem(cartItemEntity);
    emit(CartItemRemoved());
  }

  void cartItemUpdated(CartItemEntity cartItemEntity) {
    
    emit(CartItemUpdated());
  }
}
