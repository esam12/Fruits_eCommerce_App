import 'package:flutter/material.dart';
import 'package:fruits/core/entities/product_entity.dart';
import 'package:fruits/core/widgets/layouts/grid_layout.dart';
import 'package:fruits/core/widgets/product_cards/product_card_vertical.dart';
import 'package:fruits/features/product_detail/presentation/views/product_detail_view.dart';

class ProductsGridView extends StatelessWidget {
  const ProductsGridView({super.key, required this.products});
  final List<ProductEntity> products;

  @override
  Widget build(BuildContext context) {
    return TGridLayout(
      itemCount: products.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => ProductDetailView(
                product: products[index],
              ),
            ),
          ),
          child: ProductCardVertical(product: products[index]),
        );
      },
    );
  }
}
