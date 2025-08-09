import 'package:flutter/material.dart';
import 'package:fruits/core/utils/constants/app_colors.dart';
import 'package:fruits/core/utils/constants/app_images.dart';
import 'package:fruits/core/utils/constants/app_text_styles.dart';
import 'package:fruits/core/utils/constants/sizes.dart';
import 'package:fruits/core/widgets/containers/circular_image.dart';

class OrdersViewBody extends StatelessWidget {
  const OrdersViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: Sizes.xl),
          ExpansionTile(
            title: Row(
              children: [
                CircularImage(
                  image: Assets.imagesOrderTracking1,
                  backgroundColor: AppColors.notificationItemBackground,
                  padding: Sizes.md,
                  imageHeight: 32,
                  imageWidth: 32,
                ),
                SizedBox(width: Sizes.md),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('رقم الطلب: 1234567#', style: TextStyles.bold13),
                    Text('تم الطلب :22 مارس ,2024',
                        style: TextStyles.regular11),
                    SizedBox(height: 6.0),
                    Row(
                      children: [
                        Text('عدد الطلبات :', style: TextStyles.regular13),
                        Text('10', style: TextStyles.bold13),
                        SizedBox(width: Sizes.md),
                        Text('250 ليرة', style: TextStyles.bold13)
                      ],
                    )
                  ],
                )
              ],
            ),
            
          ),
        ],
      ),
    );
  }
}
