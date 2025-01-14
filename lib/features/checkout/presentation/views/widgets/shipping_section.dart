import 'package:flutter/material.dart';
import 'package:fruits/core/utils/constants/sizes.dart';
import 'package:fruits/features/checkout/domain/entities/order_entity.dart';
import 'package:fruits/features/checkout/presentation/views/widgets/shipping_item.dart';
import 'package:provider/provider.dart';

class ShippingSection extends StatefulWidget {
  const ShippingSection({super.key});

  @override
  State<ShippingSection> createState() => _ShippingSectionState();
}

class _ShippingSectionState extends State<ShippingSection> {
  int selectedIndex = -1;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: Sizes.lg),
        ShippingItem(
          onTap: () {
            selectedIndex = 0;
            setState(() {});
            context.read<OrderEntity>().payWithCash = true;

          },
          title: 'الدفع عند الاستلام',
          subTitle: 'التسليم من المكان',
          price: context
              .read<OrderEntity>()
              .cartEntity
              .calculateTotalPrice()
              .toString(),
          isSelected: selectedIndex == 0,
        ),
        const SizedBox(height: Sizes.spaceBtwItems),
        ShippingItem(
          onTap: () {
            selectedIndex = 1;
            setState(() {});
            context.read<OrderEntity>().payWithCash = false;
          },
          title: 'الدفع اونلاين',
          subTitle: 'يرجى تحديد طريقة الدفع',
          price: context
              .read<OrderEntity>()
              .cartEntity
              .calculateTotalPrice()
              .toString(),
          isSelected: selectedIndex == 1,
        ),
      ],
    );
  }
}
