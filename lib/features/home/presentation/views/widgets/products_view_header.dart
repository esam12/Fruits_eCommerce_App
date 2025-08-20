import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits/core/cubits/products_cubit/products_cubit.dart';
import 'package:fruits/core/utils/constants/app_colors.dart';
import 'package:fruits/core/utils/constants/app_images.dart';
import 'package:fruits/core/utils/constants/app_text_styles.dart';
import 'package:fruits/core/utils/constants/sizes.dart';
import 'package:fruits/features/home/presentation/views/widgets/pricing_bottom_sheet.dart';
import 'package:svg_flutter/svg_flutter.dart';

class ProductsViewHeader extends StatelessWidget {
  const ProductsViewHeader({super.key, required this.productsLength});

  final int productsLength;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          '$productsLength نتائج',
          style: TextStyles.bold16,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        const Spacer(),
        GestureDetector(
          onTap: () {
            showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
              ),
              backgroundColor: AppColors.whiteColor,
              builder: (bottomSheetContext) =>  PricingBarBottomSheet(cubit: context.read<ProductsCubit>(),),
            );

            // showBottomSheet(
            //   enableDrag: true,
            //   sheetAnimationStyle: const AnimationStyle(
            //     curve: Curves.easeInQuint,
            //     duration: Duration(seconds: 1),
            //   ),
            //   shape: const RoundedRectangleBorder(
            //     side: BorderSide(
            //         color: AppColors.bordergreyForHeader, strokeAlign: 5),
            //     borderRadius: BorderRadius.only(
            //       topLeft: Radius.circular(15),
            //       topRight: Radius.circular(15),
            //     ),
            //   ),
            //   context: context,
            //   backgroundColor: AppColors.whiteColor,
            //   builder: (context) => SizedBox(
            //     height: 300,
            //     child: Stack(
            //       children: [
            //         BackdropFilter(
            //           filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
            //           child: Container(),
            //         ),
            //         const PricingBarBottomSheet(),
            //       ],
            //     ),
            //   ),
            // );
          },
          child: Container(
            padding: const EdgeInsets.symmetric(
                horizontal: Sizes.md, vertical: Sizes.sm),
            decoration: ShapeDecoration(
              shape: RoundedRectangleBorder(
                side: const BorderSide(color: AppColors.bordergreyForHeader),
                borderRadius: BorderRadius.circular(4),
              ),
            ),
            child: SvgPicture.asset(Assets.imagesFilter2),
          ),
        ),
      ],
    );
  }
}
