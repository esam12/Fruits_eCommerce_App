import 'package:dartz/dartz.dart';
import 'package:fruits/core/errors/failures.dart';
import 'package:fruits/core/repos/orders_repo/orders_repo.dart';
import 'package:fruits/core/services/data_service.dart';
import 'package:fruits/core/utils/backend_endpoint.dart';
import 'package:fruits/features/checkout/data/models/order_model.dart';
import 'package:fruits/features/orders/domain/entities/order_entity.dart';

class OrdersRepoImpl implements OrdersRepo {
  final DatabaseService fireStoreService;

  OrdersRepoImpl({required this.fireStoreService});

  /// Add Order to Database
  @override
  Future<Either<Failure, void>> addOrder(
      {required OrderEntity orderEntity}) async {
    try {
     var orderModel = OrderModel.fromEntity(orderEntity);
      await fireStoreService.addData(
          path: BackendEndpoint.addOrders,
          documentId: orderModel.orderId,
          data: orderModel.toJson());

      return right(null);
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }
}
