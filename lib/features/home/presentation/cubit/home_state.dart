part of 'home_cubit.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class HomeLoading extends HomeState {}

final class HomeSuccess extends HomeState {
  final UserEntity userName;
  final List<ProductEntity> products;

  HomeSuccess({required this.products, required this.userName});
}

final class HomeFailure extends HomeState {
  final String message;
  HomeFailure({required this.message});
}

final class BestSellerViewLoading extends HomeState {}

final class BestSellerViewSuccess extends HomeState {
  final List<ProductEntity> products;
  BestSellerViewSuccess({required this.products});
}

final class BestSellerViewFailure extends HomeState {
  final String message;
  BestSellerViewFailure({required this.message});
}
