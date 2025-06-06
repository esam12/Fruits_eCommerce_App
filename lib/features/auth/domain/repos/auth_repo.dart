import 'package:dartz/dartz.dart';
import 'package:fruits/core/errors/failures.dart';
import 'package:fruits/features/auth/domain/entities/user_entity.dart';

abstract class AuthRepo {
  /// Create new user with email and password
  Future<Either<Failure, UserEntity>> createUserWithEmailAndPassword(
      String email, String password, String name);

  /// Sign in with email and password
  Future<Either<Failure, UserEntity>> signInWithEmailAndPassword(
      String email, String password);

  /// Sign in with google
  Future<Either<Failure, UserEntity>> signInWithGoogle();

  /// Sign in with facebook
  Future<Either<Failure, UserEntity>> signInWithFacebook();

  /// Add User Data
  Future addUserData({required UserEntity user});

  /// Save User Data
  Future saveUserData({required UserEntity user});

  /// Get User Data
  Future<UserEntity> getUserData({required String uid});
}
