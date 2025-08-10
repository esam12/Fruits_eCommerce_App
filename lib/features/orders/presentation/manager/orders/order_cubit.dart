import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fruits/core/repos/orders_repo/orders_repo.dart';
import 'package:fruits/features/orders/data/models/order_model.dart';

part 'order_state.dart';

class OrderCubit extends Cubit<OrderState> {
  final OrdersRepo ordersRepo;
  OrderCubit(this.ordersRepo) : super(OrderInitial());

  Future<void> getAllOrders() async {
    emit(OrderLoading());
    var result = await ordersRepo.getAllOrders();
    result.fold(
        (l) => emit(OrderError(l.message)), (r) => emit(OrderLoaded(r)));
  }
}
