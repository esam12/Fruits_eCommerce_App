import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits/core/repos/orders_repo/orders_repo.dart';
import 'package:fruits/core/services/get_it_service.dart';
import 'package:fruits/core/utils/constants/app_text_styles.dart';
import 'package:fruits/features/orders/presentation/manager/orders/order_cubit.dart';
import 'package:fruits/features/orders/presentation/views/widgets/orders_view_body.dart';

class OrdersView extends StatelessWidget {
  const OrdersView({super.key});

  static const String routeName = 'orders';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OrderCubit(getIt.get<OrdersRepo>())..getAllOrders(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'طلباتي',
            style: TextStyles.bold19,
          ),
          centerTitle: true,
        ),
        body: const OrdersViewBody(),
      ),
    );
  }
}
