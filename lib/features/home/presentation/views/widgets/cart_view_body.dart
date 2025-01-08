import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits/core/utils/constants/sizes.dart';
import 'package:fruits/core/widgets/custom_app_bar.dart';
import 'package:fruits/core/widgets/custom_button.dart';
import 'package:fruits/features/checkout/presentation/views/checkout_view.dart';
import 'package:fruits/features/home/presentation/cubit/cart_cubit.dart';
import 'package:fruits/features/home/presentation/views/widgets/cart_header.dart';
import 'package:fruits/features/home/presentation/views/widgets/cart_items_list.dart';

class CartViewBody extends StatelessWidget {
  const CartViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CustomScrollView(
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
            CartItemsList(
              cartItems: context.watch<CartCubit>().cartEntity.cartItems,
            ),
          ],
        ),
        if (context.read<CartCubit>().cartEntity.cartItems.isNotEmpty)
          Positioned(
            left: 16,
            right: 16,
            bottom: MediaQuery.sizeOf(context).height * .07,
            child: CustomButton(
              onPressed: () {
                Navigator.pushNamed(context, CheckoutView.routeName);
              },
              text:
                  'الدفع ${context.watch<CartCubit>().cartEntity.calculateTotalPrice()} ليرة',
            ),
          )
      ],
    );
  }
}
