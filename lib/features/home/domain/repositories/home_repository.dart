import 'package:fruits/features/profile/domain/entities/profile_entity.dart';

abstract class HomeRepository {
  Future<UserProfileEntity> getUserProfile();
}
