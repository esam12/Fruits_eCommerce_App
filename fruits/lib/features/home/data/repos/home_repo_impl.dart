import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:fruits/core/errors/failures.dart';
import 'package:fruits/core/services/firestore_service.dart';
import 'package:fruits/features/auth/data/models/user_model.dart';
import 'package:fruits/features/auth/domain/entities/user_entity.dart';
import 'package:fruits/features/home/domain/entities/home_entity.dart';
import 'package:fruits/features/home/domain/repos/home_repo.dart';

class HomeRepoImpl extends HomeRepo {
  final FireStoreService fireStoreService;

  HomeRepoImpl({required this.fireStoreService});
  @override
  Future<Either<Failure, List<ProductEntity>>> fetchLimitedProducts(
      int limit) async {
    try {
      var products = await fireStoreService.fetchLimitedProducts(limit);

      log(products.toString());
      if (products.isNotEmpty) {
        return right(products);
      } else {
        return left(ServerFailure('حدث خطأ ما , حاول مرة أخرى'));
      }
    } catch (e) {
      log(
        'Exception in HomeRepoImpl.fetchLimitedProducts: ${e.toString()}',
      );
      return left(ServerFailure('حدث خطأ ما , حاول مرة أخرى'));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> getUserName() async {
    try {
      var user = await fireStoreService.getData(
          path: 'users', docuementId: 'lNOCouV92pcZJhRXVR3KJ9YuQ3p2');

      if (user.isNotEmpty) {
        return right(UserModel.fromJson(user));
      } else {
        return left(ServerFailure('حدث خطأ ما , حاول مرة أخرى'));
      }
    } catch (e) {
      log(
        'Exception in HomeRepoImpl.getUserName: ${e.toString()}',
      );
      return left(ServerFailure('حدث خطأ ما , حاول مرة أخرى'));
    }
  }

  @override
  Future<void> uploadDummyData(List<ProductEntity> products) {
    throw UnimplementedError();
  }

  /// Fetch All Products
  @override
  Future<Either<Failure, List<ProductEntity>>> fetchAllProducts() async {
    try {
      var products = await fireStoreService.fetchAllProducts();
      if (products.isNotEmpty) {
        return right(products);
      } else {
        return left(ServerFailure('حدث خطأ ما , حاول مرة أخرى'));
      }
    } catch (e) {
      log(
        'Exception in HomeRepoImpl.fetchAllProducts: ${e.toString()}',
      );
      return left(ServerFailure('حدث خطأ ما , حاول مرة أخرى'));
    }
  }
}
