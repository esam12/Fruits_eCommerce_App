import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits/core/helper/functions/get_user.dart';
import 'package:fruits/core/repos/orders_repo/orders_repo.dart';
import 'package:fruits/core/services/get_it_service.dart';
import 'package:fruits/core/widgets/custom_app_bar.dart';
import 'package:fruits/features/orders/domain/entities/order_entity.dart';
import 'package:fruits/features/checkout/presentation/manager/add_order/add_order_cubit.dart';
import 'package:fruits/features/checkout/presentation/views/widgets/add_order_cubit_bloc_builder.dart';
import 'package:fruits/features/checkout/presentation/views/widgets/checkout_view_body.dart';
import 'package:fruits/features/home/domain/entities/cart_entity.dart';
import 'package:provider/provider.dart';

class CheckoutView extends StatefulWidget {
  const CheckoutView({super.key, required this.cartEntity});

  static const routeName = 'checkoutView';

  final CartEntity cartEntity;

  @override
  State<CheckoutView> createState() => _CheckoutViewState();
}

class _CheckoutViewState extends State<CheckoutView> {
  late OrderEntity orderEntity; // To hold the order data

  @override
  void initState() {
    super.initState();
    // Initialize the OrderEntity once in initState
    orderEntity = OrderEntity(
      cartEntity: widget.cartEntity,
      uID: getUser().uId,
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddOrderCubit(getIt.get<OrdersRepo>()),
      child: Scaffold(
        body: Provider.value(
          value: orderEntity,
          child: const AddOrderCubitBlocBuilder(
            child: CheckoutViewBody(),
          ),
        ),
        appBar: buildAppBar(
          context,
          title: 'الشحن',
          showNotification: false,
        ),
      ),
    );
  }
}
