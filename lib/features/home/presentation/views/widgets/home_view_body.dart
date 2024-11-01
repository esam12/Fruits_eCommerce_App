import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:fruits/core/cubits/products_cubit/products_cubit.dart';
import 'package:fruits/core/utils/constants/sizes.dart';
import 'package:fruits/core/widgets/section_heading.dart';
import 'package:fruits/core/widgets/text_form/search_text_field.dart';
import 'package:fruits/features/best_selling_fruits/presentation/views/best_selling_view.dart';
import 'package:fruits/features/home/presentation/views/widgets/best_selling_products_bloc_builder.dart';
import 'package:fruits/features/home/presentation/views/widgets/custom_home_app_bar.dart';
import 'package:fruits/features/home/presentation/views/widgets/home_banner_list_item.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({
    super.key,
  });

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  @override
  void initState() {
    super.initState();
    context.read<ProductsCubit>().getBestSellingProducts();
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
              const CustomHomeAppBar(),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: Sizes.md),
                child: Column(
                  children: [
                    const SizedBox(
                      height: Sizes.md,
                    ),
                    const SearchTextField(),

                    const SizedBox(height: Sizes.md),
                    const HomeBannerListItem(),
                    const SizedBox(height: Sizes.md),

                    /// Best Seller
                    SectionHeader(
                      title: "الأكثر مبيعًا",
                      onPressed: () {
                        Navigator.pushNamed(context, BestSellingView.routeName);
                      },
                    ),

                    /// Best Seller Products
                    const BestSellingProductsBlocBuilder()
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
