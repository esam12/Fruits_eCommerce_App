import 'package:dartz/dartz.dart';
import 'package:fruits/core/errors/failures.dart';
import 'package:fruits/features/auth/domain/entities/user_entity.dart';
import 'package:fruits/features/home/domain/entities/home_entity.dart';

abstract class HomeRepo {
  /// To get user name
  Future<Either<Failure, UserEntity>> getUserName();

  /// Fetch limited products
  Future<Either<Failure, List<ProductEntity>>> fetchLimitedProducts(int limit);

  /// Fetch all products
  Future<Either<Failure, List<ProductEntity>>> fetchAllProducts();

  /// Upload   /// Upload dummy data to the Cloud Firebase
  Future<void> uploadDummyData(List<ProductEntity> products);
}
