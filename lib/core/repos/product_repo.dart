import 'package:dartz/dartz.dart';
import 'package:fruits/core/entities/product_entity.dart';
import 'package:fruits/core/errors/failures.dart';

abstract class ProductRepo {

  /// Fetch Best selling products
  Future<Either<Failure, List<ProductEntity>>> fetchBestSellingProducts();

  /// Fetch all products
  Future<Either<Failure, List<ProductEntity>>> fetchAllProducts();
}
