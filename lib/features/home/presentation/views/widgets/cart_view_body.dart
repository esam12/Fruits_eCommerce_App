import 'package:flutter/material.dart';
import 'package:fruits/core/utils/constants/sizes.dart';
import 'package:fruits/core/widgets/custom_app_bar.dart';
import 'package:fruits/features/home/presentation/views/widgets/cart_header.dart';
import 'package:fruits/features/home/presentation/views/widgets/cart_items_list.dart';

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
              const CartHeader(),
              const SizedBox(
                height: Sizes.md,
              ),
            ],
          ),
        ),

        // Cart Items
        const CartItemsList(
          cartItems: [],
        ),
      ],
    );
  }
}
