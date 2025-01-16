import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fruits/core/repos/orders_repo/orders_repo.dart';
import 'package:fruits/features/checkout/domain/entities/order_entity.dart';

part 'add_order_state.dart';

class AddOrderCubit extends Cubit<AddOrderState> {
  final OrdersRepo ordersRepo;
  AddOrderCubit(this.ordersRepo) : super(AddOrderInitial());

  Future<void> addOrder(OrderEntity order) async {
    emit(AddOrderLoading());
    final result = await ordersRepo.addOrder(orderEntity: order);
    result.fold((failure) => emit(AddOrderFailure(message: failure.message)),
        (success) => emit(AddOrderSuccess()));
  }
}
