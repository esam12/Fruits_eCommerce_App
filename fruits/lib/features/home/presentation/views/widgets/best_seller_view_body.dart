import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits/core/widgets/layouts/grid_layout.dart';
import 'package:fruits/core/widgets/product_cards/product_card_vertical.dart';
import 'package:fruits/core/widgets/section_heading.dart';
import 'package:fruits/core/widgets/shimmers/product_card_vertical_shimmer.dart';
import 'package:fruits/features/home/presentation/cubit/home_cubit.dart';

class BestSellerViewBody extends StatelessWidget {
  const BestSellerViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            SizedBox(height: 24),
            SectionHeader(
              title: 'الأكثر مبيعًا',
              showActionButton: false,
            ),
            SizedBox(height: 8),
            BestSellerViewBlocBuilder(),
          ],
        ),
      ),
    );
  }
}

class BestSellerViewBlocBuilder extends StatelessWidget {
  const BestSellerViewBlocBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        if (state is HomeLoading) {
          return const ProductCardVerticalShimmer();
        } else if (state is BestSellerViewSuccess) {
          return TGridLayout(
            itemCount: state.products.length,
            itemBuilder: (context, index) {
              return ProductCardVertical(
                product: state.products[index],
              );
            },
          );
        } else if (state is BestSellerViewFailure) {
          return Text(state.message);
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}
