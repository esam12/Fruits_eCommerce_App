import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:fruits/core/utils/constants/app_colors.dart';
import 'package:fruits/core/utils/constants/app_text_styles.dart';
import 'package:fruits/core/widgets/appbar/custom_app_bar.dart';
import 'package:fruits/core/widgets/layouts/grid_layout.dart';
import 'package:fruits/core/widgets/product_cards/product_card_vertical.dart';
import 'package:fruits/core/widgets/section_heading.dart';
import 'package:fruits/core/widgets/vertical_image_and_text.dart';
import 'package:fruits/features/home/data/models/product_model.dart';
import 'package:fruits/features/home/presentation/views/widgets/primery_header_container.dart';
import 'package:fruits/features/our_products/presentation/views/widgets/pricing_bottom_sheet.dart';

class ProductsViewBody extends StatelessWidget {
  const ProductsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(right: 16.0, left: 16.0, bottom: 8.0),
        child: Column(
          children: [
            PrimeryHeaderContainer(
              appBar: CustomAppBar(
                title: const Text(
                  'المنتجات',
                  style: TextStyles.bold19,
                ),
                actions: [
                  Image.asset(
                    'assets/images/notif.png',
                    width: 35,
                    height: 35,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'منتجاتنا',
                  style: TextStyles.bold16,
                ),
                GestureDetector(
                  onTap: () {
                    showBottomSheet(
                      enableDrag: true,
                      sheetAnimationStyle: AnimationStyle(
                        curve: Curves.easeInQuint,
                        duration: const Duration(seconds: 1),
                      ),
                      shape: const RoundedRectangleBorder(
                        side: BorderSide(
                            color: AppColors.bordergreyForHeader,
                            strokeAlign: 5),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(15),
                          topRight: Radius.circular(15),
                        ),
                      ),
                      context: context,
                      backgroundColor: AppColors.whiteColor,
                      builder: (context) => SizedBox(
                        height: 300,
                        child: Stack(
                          children: [
                            BackdropFilter(
                              filter:
                                  ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                              child: Container(),
                            ),
                            const PricingBarBottomSheet(),
                          ],
                        ),
                      ),
                    );
                  },
                  child: Container(
                    width: 44,
                    height: 31,
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColors.bordergreyForHeader),
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                    child: const Icon(
                      Icons.list,
                      color: AppColors.greyTextColor,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8.0),
            SizedBox(
              height: 90,
              child: ListView.separated(
                  separatorBuilder: (context, index) => const SizedBox(
                        width: 12.0,
                      ),
                  itemCount: 5,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return const Column(
                      children: [
                        TVerticalImageText(
                          image: 'assets/images/product1.png',
                          title: 'افوكادو',
                          isNetworkImage: false,
                          backgroundColor: AppColors.gridColor,
                          textColor: AppColors.blackButtonColor,
                        ),
                      ],
                    );
                  }),
            ),
            const SizedBox(height: 24),
            const SectionHeader(
              title: 'الأكثر مبيعاً',
              showActionButton: true,
            ),
            const SizedBox(height: 8.0),
            TGridLayout(
              padding: EdgeInsets.zero,
              itemCount: 4,
              itemBuilder: (context, index) {
                return  ProductCardVertical(
                product: ProductModel.empty(),

                );
              },
            )
          ],
        ),
      ),
    );
  }
}
