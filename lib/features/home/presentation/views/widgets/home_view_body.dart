import 'package:flutter/material.dart';
import 'package:fruits/core/utils/constants/sizes.dart';
import 'package:fruits/core/widgets/section_heading.dart';
import 'package:fruits/features/home/presentation/views/best_seller_view.dart';
import 'package:fruits/features/home/presentation/views/widgets/best_seller_bloc_builder.dart';
import 'package:fruits/features/home/presentation/views/widgets/custom_home_app_bar.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: Sizes.md),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: [
                const SizedBox(
                  height: Sizes.md,
                ),

                /// Header Section
                const CustomHomeAppBar(),

                const SizedBox(height: Sizes.md),

                /// Best Seller
                SectionHeader(
                  title: "الأكثر مبيعًا",
                  onPressed: () {
                    Navigator.pushNamed(context, BestSellerView.routeName);
                  },
                ),

                /// Best Seller Products
                const BestSellerBlocBuilder(),
              ],
            ),
          )
        ],
      ),
    );
  }
}
