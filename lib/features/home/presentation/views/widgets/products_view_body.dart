import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits/core/cubits/products_cubit/products_cubit.dart';
import 'package:fruits/core/utils/constants/sizes.dart';
import 'package:fruits/core/widgets/text_form/search_text_field.dart';
import 'package:fruits/features/home/presentation/views/widgets/best_selling_products_bloc_builder.dart';
import 'package:fruits/features/home/presentation/views/widgets/custom_home_app_bar.dart';
import 'package:fruits/features/home/presentation/views/widgets/products_view_header.dart';

class ProductsViewBody extends StatefulWidget {
  const ProductsViewBody({super.key});

  @override
  State<ProductsViewBody> createState() => _ProductsViewBodyState();
}

class _ProductsViewBodyState extends State<ProductsViewBody> {
  @override
  void initState() {
    super.initState();
    context.read<ProductsCubit>().getProducts();
  }

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            children: [
              SizedBox(
                height: Sizes.md,
              ),

              /// Header Section
              CustomHomeAppBar(),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: Sizes.md),
                child: Column(
                  children: [
                    SizedBox(
                      height: Sizes.md,
                    ),
                    SearchTextField(),

                    SizedBox(height: Sizes.md),

                    /// Best Seller
                    ProductsViewHeader(productsLength: 2),

                    SizedBox(height: Sizes.md),

                    /// Best Seller Products
                    BestSellingProductsBlocBuilder()
                  ],
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
