import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits/core/widgets/layouts/grid_layout.dart';
import 'package:fruits/core/widgets/product_cards/product_card_vertical.dart';
import 'package:fruits/core/widgets/shimmers/product_card_vertical_shimmer.dart';
import 'package:fruits/features/home/presentation/cubit/home_cubit.dart';
import 'package:fruits/features/product_detail/presentation/views/product_detail_view.dart';

class BestSellerBlocBuilder extends StatelessWidget {
  const BestSellerBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        if (state is HomeLoading) {
          return const ProductCardVerticalShimmer();
        } else if (state is HomeSuccess) {
          return TGridLayout(
              itemCount: state.products.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    print(state.products[index]);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ProductDetailView(
                                  product: state.products[index],
                                )));
                  },
                  child: ProductCardVertical(
                    product: state.products[index],
                  ),
                );
              });
        } else if (state is HomeFailure) {
          return Text(state.message);
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}
