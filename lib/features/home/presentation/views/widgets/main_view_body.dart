import 'package:flutter/material.dart';
import 'package:fruits/features/home/presentation/views/cart_view.dart';
import 'package:fruits/features/home/presentation/views/products_view.dart';
import 'package:fruits/features/home/presentation/views/widgets/home_view.dart';

class MainViewBody extends StatelessWidget {
  const MainViewBody({
    super.key,
    required this.currentViewIndex,
  });

  final int currentViewIndex;

  @override
  Widget build(BuildContext context) {
    return IndexedStack(
      index: currentViewIndex,
      children: const [
        HomeView(),
        ProductsView(),
        CartView(),
      ],
    );
  }
}