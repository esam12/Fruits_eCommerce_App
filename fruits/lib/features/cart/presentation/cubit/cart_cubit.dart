import 'package:bloc/bloc.dart';
import 'package:fruits/features/cart/data/models/cart_model.dart';
import 'package:fruits/features/cart/domain/repos/cart_repo.dart';
import 'package:meta/meta.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  final CartRepo cartRepo;

  CartCubit({required this.cartRepo}) : super(CartInitial());

  // Add an item to the cart
  Future<void> addToCart(CartModel cartModel) async {
    try {
      final currentState = state;
      if (currentState is CartSuccess) {
        await cartRepo.addToCart(cartModel);
        final updatedCartItems = await cartRepo.getCartItems();
        _updateCartState(updatedCartItems);
      }
    } catch (e) {
      emit(CartFailure(message: 'Failed to add item to cart.'));
    }
  }

  // Private method to calculate totals and emit CartLoaded state
  void _updateCartState(List<CartModel> cartItems) {
    double totalCartPrice = 0.0;
    int noOfCartItems = 0;

    for (var item in cartItems) {
      totalCartPrice += item.price * item.quantity;
      noOfCartItems += item.quantity;
    }

    emit(CartSuccess(
      cartItems: cartItems,
      noOfCartItems: noOfCartItems,
      totalCartPrice: totalCartPrice,
    ));
  }
}
