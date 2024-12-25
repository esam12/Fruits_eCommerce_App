import 'package:flutter/material.dart';
import 'package:fruits/core/entities/product_entity.dart';
import 'package:fruits/core/widgets/layouts/grid_layout.dart';
import 'package:fruits/core/widgets/product_cards/product_card_vertical.dart';

class BestSellingProducts extends StatelessWidget {
  const BestSellingProducts({super.key, required this.products});
  final List<ProductEntity> products;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: TGridLayout(
        itemCount: products.length,
        itemBuilder: (context, index) {
          return ProductCardVertical(product: products[index]);
        },
      ),
    );
  }
}
