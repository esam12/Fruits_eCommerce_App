import 'package:fruits/features/profile/domain/entities/profile_entity.dart';

abstract class ProfileRepository {
  Future<UserProfileEntity> getUserProfile();

  Future<void> updateUserProfile(UserProfileEntity userProfileEntity);
}
