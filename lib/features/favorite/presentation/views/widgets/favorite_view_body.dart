import 'package:flutter/material.dart';
import 'package:fruits/core/entities/product_entity.dart';
import 'package:fruits/core/widgets/product_cards/product_card_vertical.dart';

class FavoriteViewBody extends StatelessWidget {
  const FavoriteViewBody({super.key});
  

  @override
  Widget build(BuildContext context) {
    return ProductCardVertical(
      product: [] as ProductEntity,
    );
  }
}