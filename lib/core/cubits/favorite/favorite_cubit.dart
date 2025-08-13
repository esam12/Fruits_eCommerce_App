import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fruits/features/favorite/domain/repos/favorite_repository.dart';

part 'favorite_state.dart';

class FavoriteCubit extends Cubit<FavoriteState> {
  final FavoriteRepository favoriteRepository;

  FavoriteCubit({required this.favoriteRepository}) : super(FavoriteInitial());

  Future<void> loadFavorites() async {
    try {
      final favorites = await favoriteRepository.getFavorites();
      emit(FavoriteSuccess(favorites: favorites));
    } catch (e) {
      emit(FavoriteFailure(message: e.toString()));
    }
  }

  Future<void> toggleFavorite(String productId) async {
    if (state is! FavoriteSuccess) return;

    final currentFavorites = List<String>.from(
      (state as FavoriteSuccess).favorites,
    );

    try {
      if (currentFavorites.contains(productId)) {
        await favoriteRepository.removeFavorite(productId);
        currentFavorites.remove(productId);
      } else {
        await favoriteRepository.addFavorite(productId);
        currentFavorites.add(productId);
      }
      emit(FavoriteSuccess(favorites: currentFavorites));
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
