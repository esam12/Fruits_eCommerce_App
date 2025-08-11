part of 'favorite_cubit.dart';

sealed class FavoriteState extends Equatable {
  const FavoriteState();

  @override
  List<Object> get props => [];
}

final class FavoriteInitial extends FavoriteState {}

final class FavoriteSuccess extends FavoriteState {
  final List<String> favorites;
  const FavoriteSuccess({required this.favorites});
}

final class FavoriteFailure extends FavoriteState {
  final String message;
  const FavoriteFailure({required this.message});
}
