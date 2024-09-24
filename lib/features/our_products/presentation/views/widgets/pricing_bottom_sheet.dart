import 'package:flutter/material.dart';
import 'package:fruits/core/utils/constants/app_colors.dart';
import 'package:fruits/core/utils/constants/app_text_styles.dart';
import 'package:fruits/core/widgets/custom_button.dart';

class PricingBarBottomSheet extends StatefulWidget {
  const PricingBarBottomSheet({super.key});

  @override
  PricingBarBottomSheetState createState() => PricingBarBottomSheetState();
}

class PricingBarBottomSheetState extends State<PricingBarBottomSheet> {
  RangeValues _currentRangeValues = const RangeValues(100, 500);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Align(
            alignment: Alignment.center,
            child: Container(
              height: 5,
              width: 60,
              decoration: BoxDecoration(
                color: AppColors.primaryColor,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'تصنيف حسب :',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          const Row(
            children: [
              Icon(
                Icons.discount_outlined,
                size: 16.0,
              ),
              SizedBox(width: 8.0),
              Text(
                'السعر:',
                style: TextStyles.bold13,
              ),
            ],
          ),
          const SizedBox(height: 16.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                height: 36,
                width: 135,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: AppColors.greyTextColor),
                ),
                child: Center(
                  child: Text(
                    _currentRangeValues.start.round().toString(),
                  ),
                ),
              ),
              const Text(
                'الي',
                style: TextStyles.bold13,
              ),
              Container(
                height: 36,
                width: 135,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: AppColors.greyTextColor),
                ),
                child: Center(
                  child: Text(
                    _currentRangeValues.end.round().toString(),
                  ),
                ),
              ),
            ],
          ),
          RangeSlider(
            values: _currentRangeValues,
            min: 0,
            max: 1000,
            divisions: 100,
            labels: RangeLabels(
              _currentRangeValues.start.round().toString(),
              _currentRangeValues.end.round().toString(),
            ),
            onChanged: (RangeValues values) {
              setState(() {
                _currentRangeValues = values;
              });
            },
          ),
          const SizedBox(height: 20),
          CustomButton(
            text: 'تصفيه',
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
