import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits/core/utils/constants/app_colors.dart';
import 'package:fruits/core/utils/constants/app_text_styles.dart';
import 'package:fruits/core/utils/constants/sizes.dart';
import 'package:fruits/core/widgets/containers/circular_image.dart';
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
                              ListView.builder(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: order.orderProducts.length,
                                itemBuilder: (context, index) {
                                  final product = order.orderProducts[index];
                                  return Card(
                                    elevation: 2,
                                    margin: const EdgeInsets.symmetric(
                                        vertical: Sizes.xs),
                                    child: Padding(
                                      padding: const EdgeInsets.all(Sizes.sm),
                                      child: Row(
                                        children: [
                                          // Product Image
                                          CircularImage(
                                            image: product.imageUrl,
                                            isNetworkImage: true,
                                            imageHeight: 60,
                                            imageWidth: 60,
                                            
                                          ),
                                          const SizedBox(width: Sizes.md),
                                          // Product Name and Quantity
                                          Expanded(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  product.name,
                                                  style: TextStyles.bold13,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                                const SizedBox(
                                                    height: Sizes.xs),
                                                Text(
                                                  'الكمية: ${product.quantity}',
                                                  style: TextStyles.regular13
                                                      .copyWith(
                                                          color: AppColors
                                                              .greyTextColor),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              ),
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
