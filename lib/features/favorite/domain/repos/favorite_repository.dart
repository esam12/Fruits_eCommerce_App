abstract class FavoriteRepository {
  Future<void> addFavorite(String productId);
  Future<void> removeFavorite(String productId);
  Future<List<String>> getFavorites();
  Future<bool> isFavorite(String productId);
}
