import 'dart:developer';

import 'package:fruits/core/services/data_service.dart';
import 'package:fruits/core/services/firebase_auth_service.dart';
import 'package:fruits/features/profile/domain/entities/profile_entity.dart';
import 'package:fruits/features/profile/domain/repos/profile_repository.dart';

class ProfileRepositoryImpl implements ProfileRepository {
  final FirebaseAuthService firebaseAuthService;
  final DatabaseService databaseService;

  ProfileRepositoryImpl({
    required this.firebaseAuthService,
    required this.databaseService,
  });

  @override
  Future<UserProfileEntity> getUserProfile() async {
    try {
      final user = firebaseAuthService.authUser;
      if (user == null) throw Exception("User not logged in");

      final doc = await databaseService.getData(
        path: 'users',
        documentId: user.uid,
      );

      final data = doc as Map<String, dynamic>;
      log(data.toString());
      return UserProfileEntity(
        id: user.uid,
        name: data['name'],
        email: data['email'],
      );
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<void> updateUserProfile(UserProfileEntity userProfileEntity) {
    // TODO: implement updateUserProfile
    throw UnimplementedError();
  }
}
