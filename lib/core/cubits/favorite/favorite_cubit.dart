import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fruits/features/favorite/domain/repos/favorite_repository.dart';

part 'favorite_state.dart';

class FavoriteCubit extends Cubit<FavoriteState> {
  final FavoriteRepository favoriteRepository;

  FavoriteCubit({required this.favoriteRepository})
      : super(FavoriteInitial());

  Future<void> loadFavorites() async {
    try {
      final favorites = await favoriteRepository.getFavorites();
      emit(FavoriteSuccess(favorites: favorites));
    } catch (e) {
      emit(FavoriteFailure(message: e.toString()));
    }
  }

  Future<void> addFavorite(String productId) async {
    try {
      await favoriteRepository.addFavorite(productId);
      if (state is FavoriteSuccess) {
        final updatedFavorites = List<String>.from(
            (state as FavoriteSuccess).favorites)
          ..add(productId);
        emit(FavoriteSuccess(favorites: updatedFavorites));
      } else {
        emit(FavoriteSuccess(favorites: [productId]));
      }
    } catch (e) {
      emit(FavoriteFailure(message: e.toString()));
    }
  }

  Future<void> removeFavorite(String productId) async {
    try {
      await favoriteRepository.removeFavorite(productId);
      if (state is FavoriteSuccess) {
        final updatedFavorites = List<String>.from(
            (state as FavoriteSuccess).favorites)
          ..remove(productId);
        emit(FavoriteSuccess(favorites: updatedFavorites));
      }
    } catch (e) {
      emit(FavoriteFailure(message: e.toString()));
    }
  }

  bool isFavorite(String productId) {
    if (state is FavoriteSuccess) {
      return (state as FavoriteSuccess).favorites.contains(productId);
    }
    return false;
  }
}