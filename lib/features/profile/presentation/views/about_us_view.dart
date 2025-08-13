import 'package:flutter/material.dart';
import 'package:fruits/core/utils/constants/app_text_styles.dart';
import 'package:fruits/features/profile/presentation/views/widgets/about_us_view_body.dart';

class AboutUsView extends StatelessWidget {
  const AboutUsView({super.key});

  static const String routeName = 'about-us';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('من نحن', style: TextStyles.bold19),
        centerTitle: true,
      ),
      body: const AboutUsViewBody(),
    );
  }
}
