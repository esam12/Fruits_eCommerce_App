import 'package:dartz/dartz.dart';
import 'package:fruits/core/errors/failures.dart';
import 'package:fruits/features/checkout/domain/entities/order_entity.dart';

abstract class OrdersRepo {
  // Add Order To Firebase
  Future<Either<Failure, void>> addOrder({required OrderEntity orderEntity});
}
