import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits/core/cubits/products_cubit/products_cubit.dart';
import 'package:fruits/core/widgets/custom_error_widget.dart';
import 'package:fruits/core/widgets/shimmers/product_card_vertical_shimmer.dart';
import 'package:fruits/features/home/presentation/views/widgets/products_grid_view.dart';

class ProductsGridViewBlocBuilder extends StatelessWidget {
  const ProductsGridViewBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductsCubit, ProductsState>(
      builder: (context, state) {
        if (state is ProductsSuccess) {
          return ProductsGridView(
            products: state.products,
          );
        } else if (state is ProductsFailure) {
          return CustomErrorWidget(text: state.message);
        } else {
          return const ProductCardVerticalShimmer();
        }
      },
    );
  }
}
