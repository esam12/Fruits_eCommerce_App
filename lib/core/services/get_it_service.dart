import 'package:fruits/core/cubits/favorite/favorite_cubit.dart';
import 'package:fruits/core/repos/orders_repo/orders_repo.dart';
import 'package:fruits/core/repos/orders_repo/orders_repo_impl.dart';
import 'package:fruits/core/repos/product_repo/product_repo.dart';
import 'package:fruits/core/repos/product_repo/product_repo_impl.dart';
import 'package:fruits/core/services/data_service.dart';
import 'package:fruits/core/services/firebase_auth_service.dart';
import 'package:fruits/core/services/firestore_service.dart';
import 'package:fruits/features/auth/data/repos/auth_repo_impl.dart';
import 'package:fruits/features/auth/domain/repos/auth_repo.dart';
import 'package:fruits/features/favorite/data/repos/favorite_repository_impl.dart';
import 'package:fruits/features/favorite/domain/repos/favorite_repository.dart';
import 'package:fruits/features/notification/data/repos/notification_repository_impl.dart';
import 'package:fruits/features/notification/domain/repos/notification_repository.dart';
import 'package:fruits/features/profile/data/repos/profile_repository_impl.dart';
import 'package:fruits/features/profile/domain/repos/profile_repository.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setUpGetIt() {
  getIt.registerSingleton<FirebaseAuthService>(FirebaseAuthService());
  getIt.registerSingleton<DatabaseService>(FireStoreService());
  getIt.registerSingleton(FireStoreService());

  getIt.registerSingleton<AuthRepo>(
    AuthRepoImpl(
      firebaseAuthService: getIt<FirebaseAuthService>(),
      databaseService: getIt<DatabaseService>(),
    ),
  );

  getIt.registerSingleton<ProductRepo>(
    ProductRepoImpl(
      fireStoreService: getIt<FireStoreService>(),
    ),
  );

  // Order Repo
  getIt.registerSingleton<OrdersRepo>(
    OrdersRepoImpl(
      fireStoreService: getIt<DatabaseService>(),
    ),
  );

  // Product Repo
  getIt.registerSingleton<ProfileRepository>(
    ProfileRepositoryImpl(
      firebaseAuthService: getIt<FirebaseAuthService>(),
      databaseService: getIt<DatabaseService>(),
    ),
  );

  // Favorite Repo
  getIt.registerSingleton<FavoriteRepository>(
    FavoriteRepositoryImpl(
      firebaseAuthService: getIt<FirebaseAuthService>(),
      databaseService: getIt<DatabaseService>(),
    ),
  );

  // Notification Repo
  getIt.registerSingleton<NotificationRepository>(
    NotificationRepositoryImpl(
      databaseService: getIt<DatabaseService>(),
    ),
  );

  // Favorite Cubit
  getIt.registerFactory(
      () => FavoriteCubit(favoriteRepository: getIt<FavoriteRepository>()));
}
