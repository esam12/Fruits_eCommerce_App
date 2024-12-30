import 'package:flutter/material.dart';
import 'package:fruits/features/our_products/presentation/views/widgets/products_view_body.dart';

class OurProductsView extends StatelessWidget {
  const OurProductsView({super.key});

  static const String routeName = 'ourProductsView';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: ProductsViewBody(),
    );
  }
}
