import 'package:flutter/material.dart';
import 'package:fruits/core/utils/constants/sizes.dart';
import 'package:fruits/features/home/presentation/views/widgets/home_banner_item.dart';

class HomeBannerListItem extends StatelessWidget {
  const HomeBannerListItem({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(
          4,
          (index) => const Padding(
            padding: EdgeInsets.only(left: Sizes.md),
            child: HomeBannerItem(),
          ),
        ),
      ),
    );
  }
}
