part of 'cart_cubit.dart';

@immutable
sealed class CartState {}

final class CartInitial extends CartState {}

final class CartLoading extends CartState {}

final class CartSuccess extends CartState {
  final List<CartModel> cartItems;
  final int noOfCartItems;
  final double totalCartPrice;

  CartSuccess({
    required this.cartItems,
    required this.noOfCartItems,
    required this.totalCartPrice,
  });
}

final class CartFailure extends CartState {
  final String message;
  CartFailure({required this.message});
}
