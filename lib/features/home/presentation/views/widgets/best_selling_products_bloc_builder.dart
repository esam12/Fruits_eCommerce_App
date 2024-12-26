import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits/core/cubits/products_cubit/products_cubit.dart';
import 'package:fruits/core/helper/functions/get_dummy_product.dart';
import 'package:fruits/core/widgets/custom_error_widget.dart';
import 'package:fruits/features/home/presentation/views/widgets/best_selling_products.dart';

class BestSellingProductsBlocBuilder extends StatelessWidget {
  const BestSellingProductsBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductsCubit, ProductsState>(
      builder: (context, state) {
        if (state is ProductsSuccess) {
          return BestSellingProducts(
            products: state.products,
          );
        } else if (state is ProductsFailure) {
          return CustomErrorWidget(text: state.message);
        } else {
          return BestSellingProducts(
            products: getDummyProducts(),
          );
        }
      },
    );
  }
}
