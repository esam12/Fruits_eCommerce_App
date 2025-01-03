import 'package:flutter/material.dart';
import 'package:fruits/core/utils/constants/app_colors.dart';
import 'package:fruits/core/utils/constants/app_text_styles.dart';
import 'package:fruits/core/utils/constants/sizes.dart';
import 'package:fruits/core/widgets/custom_app_bar.dart';
import 'package:fruits/features/home/presentation/views/widgets/cart_item.dart';

class CartViewBody extends StatelessWidget {
  const CartViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            children: [
              const SizedBox(
                height: Sizes.md,
              ),

              /// Header Section
              buildAppBar(
                context,
                title: 'السلة',
                showBackButton: false,
                showNotification: false,
              ),
              const SizedBox(
                height: Sizes.md,
              ),

              Container(
                decoration: const BoxDecoration(
                    color: AppColors.notificationItemBackground),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20.0),
                    child: Text(
                      'لديك 3 منتجات في سله التسوق',
                      style: TextStyles.regular13.copyWith(
                        color: AppColors.primaryColor,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: Sizes.md,
              ),

              CartItem(),
            ],
          ),
        )
      ],
    );
  }
}
