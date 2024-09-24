import 'package:flutter/material.dart';
import 'package:fruits/core/utils/constants/app_colors.dart';
import 'package:fruits/core/utils/constants/app_text_styles.dart';
import 'package:fruits/core/widgets/layouts/grid_layout.dart';
import 'package:fruits/core/widgets/product_cards/product_card_vertical.dart';
import 'package:fruits/features/home/data/models/product_model.dart';

class SearchingViewBody extends StatelessWidget {
  const SearchingViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 16.0),
            SearchingTextFormField(),
            // const SearchingDataNotFound(),

            // SearchingInitailWidget(),
            SearchingLoadData()
          ],
        ),
      ),
    );
  }
}

class SearchingLoadData extends StatelessWidget {
  const SearchingLoadData({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 16.0,
        ),
        Text(
          'نتائج البحث',
          style: TextStyles.regular13.copyWith(color: AppColors.greyTextColor),
        ),
        const SizedBox(
          height: 16.0,
        ),
        TGridLayout(
          itemCount: 1,
          itemBuilder: (context, index) {
            return ProductCardVertical(
              product: ProductModel.empty(),
            );
          },
        )
      ],
    );
  }
}

class SearchingInitailWidget extends StatelessWidget {
  const SearchingInitailWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 24.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'عمليات البحث الأخيرة',
              style: TextStyles.semiBold13,
            ),
            Text(
              'حذف الكل',
              style: TextStyles.regular13.copyWith(
                color: AppColors.greyTextColor,
              ),
            ),
          ],
        ),
        const SizedBox(height: 16.0),
        SizedBox(
          height: 150,
          child: ListView.builder(
              itemCount: 4,
              itemBuilder: (context, index) {
                return const ListTile(
                  contentPadding: EdgeInsets.all(0),
                  title: Text('فراولة', style: TextStyles.regular16),
                  leading: Icon(
                    Icons.access_time_rounded,
                    color: AppColors.greyTextColor,
                  ),
                  trailing: Icon(
                    Icons.clear,
                  ),
                );
              }),
        )
      ],
    );
  }
}

class SearchingDataNotFound extends StatelessWidget {
  const SearchingDataNotFound({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          height: 80,
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.0),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.shade300,
                blurRadius: 3.0,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Text(
            'لاتوجد نتائج بحث',
            style:
                TextStyles.regular13.copyWith(color: AppColors.greyTextColor),
          ),
        ),
        Column(
          children: [
            const SizedBox(
              height: 124,
            ),
            SizedBox(
              width: 230,
              height: 230,
              child: Image.asset(
                'assets/images/searching_not_found.png',
              ),
            ),
            const Text('البحث', style: TextStyles.bold16),
            Text(
              'عفوًا... هذه المعلومات غير متوفرة ',
              style: TextStyles.regular13.copyWith(
                color: AppColors.greyTextColor,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        )
      ],
    );
  }
}

class SearchingTextFormField extends StatelessWidget {
  const SearchingTextFormField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade300,
            blurRadius: 3.0,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: TextFormField(
        decoration: const InputDecoration(
          border: InputBorder.none,
          hintText: "ابحث عن.....",
          prefixIcon: Icon(Icons.search),
          suffixIcon: Icon(Icons.filter_list),
        ),
      ),
    );
  }
}
