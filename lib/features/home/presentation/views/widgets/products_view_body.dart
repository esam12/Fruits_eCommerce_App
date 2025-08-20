import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits/core/cubits/products_cubit/products_cubit.dart';
import 'package:fruits/core/utils/constants/sizes.dart';
import 'package:fruits/core/widgets/custom_app_bar.dart';
import 'package:fruits/core/widgets/text_form/search_text_field.dart';
import 'package:fruits/features/home/presentation/views/widgets/products_grid_view_bloc_builder.dart';
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
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            children: [
              const SizedBox(
                height: Sizes.md,
              ),

              /// Header Section
              buildAppBar(context, title: 'المنتجات', showBackButton: false),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: Sizes.md),
                child: Column(
                  children: [
                    const SizedBox(
                      height: Sizes.md,
                    ),
                    const SearchTextField(),

                    const SizedBox(height: Sizes.md),

                    /// Best Seller
                    BlocSelector<ProductsCubit, ProductsState, int>(
                      selector: (state) {
                        if (state is ProductsSuccess) {
                          return state.products.length;
                        } else {
                          return 0;
                        }
                      },
                      builder: (context, productsLength) {
                        return ProductsViewHeader(
                            productsLength: productsLength);
                      },
                    ),

                    const SizedBox(height: Sizes.md),

                    /// Best Seller Products
                    const ProductsGridViewBlocBuilder()
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
