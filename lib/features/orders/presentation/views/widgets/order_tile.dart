import 'package:flutter/material.dart';
import 'package:fruits/core/utils/constants/app_colors.dart';
import 'package:fruits/core/utils/constants/app_images.dart';
import 'package:fruits/core/utils/constants/app_text_styles.dart';
import 'package:fruits/core/utils/constants/sizes.dart';
import 'package:fruits/core/widgets/containers/circular_image.dart';
import 'package:fruits/features/orders/data/models/order_model.dart';
import 'package:intl/intl.dart';

class OrderTile extends StatelessWidget {
  final OrderModel order; // Added parameter to receive a single order

  const OrderTile({
    super.key,
    required this.order,
  });

  @override
  Widget build(BuildContext context) {
    String formatDate(String dateString) {
      final dateTime = DateTime.parse(dateString);
      return DateFormat('dd MMM, yyyy', 'ar_SA').format(dateTime);
    }

    return Row(
      children: [
        const CircularImage(
          image: Assets.imagesOrderTracking1,
          backgroundColor: AppColors.notificationItemBackground,
          padding: Sizes.md,
          imageHeight: 32,
          imageWidth: 32,
        ),
        const SizedBox(width: Sizes.md),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Text(
                    'رقم الطلب:',
                    style: TextStyles.bold13,
                  ),
                  const SizedBox(width: 8),
                  Flexible(
                    child: Text(
                      '#${order.orderId}', // Use the passed order object
                      overflow: TextOverflow.ellipsis,
                      style: TextStyles.bold13,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  const Text('تم الطلب: ', style: TextStyles.regular11),
                  Text(
                    formatDate(order.date), // Use the passed order object
                    style: TextStyles.regular11,
                  ),
                  // const Spacer(),
                  // Container(
                  //   padding:
                  //       const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  //   decoration: BoxDecoration(
                  //     color: AppColors.secondaryColor,
                  //     borderRadius: BorderRadius.circular(50),
                  //   ),
                  //   child: Text(
                  //     order.status, // Use the passed order object
                  //     style:
                  //         TextStyles.regular11.copyWith(color: AppColors.whiteColor),
                  //   ),
                  // )
                ],
              ),
              const SizedBox(height: 6.0),
              Row(
                children: [
                  const Text('عدد الطلبات :', style: TextStyles.regular13),
                  Text(
                      order.orderProducts.length
                          .toString(), // Use the passed order object
                      style: TextStyles.bold13),
                  const SizedBox(width: Sizes.md),
                  Text('${order.totalPrice} ليرة', style: TextStyles.bold13)
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}
