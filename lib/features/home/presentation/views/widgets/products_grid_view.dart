import 'package:flutter/material.dart';
import 'package:fruits/core/entities/product_entity.dart';
import 'package:fruits/core/widgets/layouts/grid_layout.dart';
import 'package:fruits/core/widgets/product_cards/product_card_vertical.dart';

class ProductsGridView extends StatelessWidget {
  const ProductsGridView({super.key, required this.products});
  final List<ProductEntity> products;

  @override
  Widget build(BuildContext context) {
    return TGridLayout(
      itemCount: products.length,
      itemBuilder: (context, index) {
        return ProductCardVertical(product: products[index]);
      },
    );
  }
}
