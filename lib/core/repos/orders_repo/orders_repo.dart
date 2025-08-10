import 'package:dartz/dartz.dart';
import 'package:fruits/core/errors/failures.dart';
import 'package:fruits/features/orders/data/models/order_model.dart';
import 'package:fruits/features/orders/domain/entities/order_entity.dart';

abstract class OrdersRepo {
  // Add Order To Firebase
  Future<Either<Failure, void>> addOrder({required OrderEntity orderEntity});

  // Get All Orders From Firebase
  Future<Either<Failure, List<OrderModel>>> getAllOrders();

  Future<Either<Failure, Unit>> deleteOrder(int orderId);
}
