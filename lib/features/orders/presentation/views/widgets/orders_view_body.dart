import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits/core/utils/constants/app_text_styles.dart';
import 'package:fruits/core/utils/constants/sizes.dart';
import 'package:fruits/features/orders/presentation/manager/orders/order_cubit.dart';
import 'package:fruits/features/orders/presentation/views/widgets/order_tile.dart';
import 'package:fruits/features/orders/presentation/views/widgets/tracking_steps_widget.dart';

class OrdersViewBody extends StatelessWidget {
  const OrdersViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrderCubit, OrderState>(
      builder: (context, state) {
        if (state is OrderLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is OrderError) {
          return Center(child: Text(state.message));
        } else if (state is OrderLoaded) {
          return SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: Sizes.xl),
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: state.orders.length,
                  itemBuilder: (context, index) {
                    final order = state.orders[index];

                    // Conditionally build the children based on the order status
                    final expansionChildren = <Widget>[];
                    if (order.status == 'Delivered') {
                      expansionChildren.add(
                        Padding(
                          padding: const EdgeInsets.all(Sizes.md),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'تفاصيل الطلب:',
                                style: TextStyles.bold16,
                              ),
                              const SizedBox(height: Sizes.sm),
                              ...order.orderProducts.map((product) => Text(
                                    '${product.name} x${product.quantity}',
                                    style: TextStyles.regular13,
                                  )),
                            ],
                          ),
                        ),
                      );
                    } else {
                      // Show tracking steps for all other statuses
                      expansionChildren.add(
                        TrackingSteps(status: order.status),
                      );
                    }

                    return ExpansionTile(
                      title: OrderTile(order: order),
                      children: expansionChildren,
                    );
                  },
                ),
              ],
            ),
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}
