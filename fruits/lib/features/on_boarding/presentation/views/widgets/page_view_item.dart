import 'package:flutter/material.dart';
import 'package:svg_flutter/svg.dart';

class PageViewItem extends StatelessWidget {
  const PageViewItem(
      {super.key,
      required this.backgroundImage,
      required this.image,
      required this.title,
      required this.subTitle,
      this.showStartButton = false,
      this.showSkipButton = true,
      required this.pageViewIndex});

  final String backgroundImage;
  final String image;
  final Widget title;
  final String subTitle;
  final int pageViewIndex;
  final bool showStartButton;
  final bool showSkipButton;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          height: MediaQuery.of(context).size.height * 0.5,
          child: Stack(
            children: [
              Positioned.fill(
                child: SvgPicture.asset(
                  backgroundImage,
                  fit: BoxFit.fill,
                ),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                left: 0,
                child: SvgPicture.asset(
                  image,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextButton(onPressed: () {}, child: const Text("تخط")),
              ),
            ],
          ),
        ),
        const SizedBox(height: 64),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 37.0),
          child: Column(
            children: [
              title,
              const SizedBox(height: 24),
              Text(
                subTitle,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
