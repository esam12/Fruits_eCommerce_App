import 'package:flutter/material.dart';
import 'package:fruits/core/utils/constants/app_colors.dart';
import 'package:fruits/core/widgets/appbar/custom_app_bar.dart';
import 'package:fruits/core/widgets/custom_button.dart';
import 'package:fruits/features/home/domain/entities/home_entity.dart';
import 'package:fruits/features/product_detail/presentation/views/widgets/product_detail_view_body.dart';

class ProductDetailView extends StatelessWidget {
  const ProductDetailView({super.key, required this.product});

  final ProductEntity product;
  static const routeName = 'productDetailView';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ProductDetailViewBody(
        product: product,
      ),
      appBar: const CustomAppBar(
        showBackArrow: true,
        backgroundColor: AppColors.gridColor,
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(
          left: 20.0,
          right: 20.0,
          bottom: 10.0,
          top: 10.0,
        ),
        child: CustomButton(
          text: 'أضف الي السلة',
          onPressed: () {},
        ),
      ),
    );
  }
}
