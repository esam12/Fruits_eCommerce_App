import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fruits/core/errors/failures.dart';
import 'package:fruits/core/services/firebase_auth_service.dart';
import 'package:fruits/core/services/firestore_service.dart';
import 'package:fruits/core/utils/backend_endpoint.dart';
import 'package:fruits/features/favorite/domain/repos/favorite_repository.dart';

class FavoriteRepositoryImpl implements FavoriteRepository {
  final FireStoreService fireStoreService;
  final FirebaseAuthService firebaseAuthService;
  FavoriteRepositoryImpl(
      {required this.fireStoreService, required this.firebaseAuthService});
  @override
  Future<void> addFavorite(String productId) async {
    try {
      await fireStoreService.updateData(
        path:
            "${BackendEndpoint.getUsersData}/${firebaseAuthService.authUser!.uid}",
        data: {
          "favorites": FieldValue.arrayUnion([productId]),
        },
      );
    } catch (e) {
      throw ServerFailure(e.toString());
    }
  }

  @override
  Future<List<String>> getFavorites() async {
    try {
      final doc = await fireStoreService.getData(
        path:
            "${BackendEndpoint.getUsersData}/${firebaseAuthService.authUser!.uid}",
      );
      final data = doc.data() as Map<String, dynamic>;
      final favorites = List<String>.from(data["favorites"] ?? []);
      return favorites;
    } catch (e) {
      throw ServerFailure(e.toString());
    }
  }

  @override
  Future<bool> isFavorite(String productId) async {
    final favorites = await getFavorites();
    return favorites.contains(productId);
  }

  @override
  Future<void> removeFavorite(String productId) async {
    try {
      await fireStoreService.updateData(
        path:
            "${BackendEndpoint.getUsersData}/${firebaseAuthService.authUser!.uid}",
        data: {
          "favorites": FieldValue.arrayRemove([productId]),
        },
      );
    } catch (e) {
      throw ServerFailure(e.toString());
    }
  }
}
