import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:fruits/core/utils/constants/sizes.dart';
import 'package:fruits/core/widgets/shimmers/shimmer_effect.dart';

class TRoundedImage extends StatelessWidget {
  const TRoundedImage({
    super.key,
    this.width,
    this.height,
    required this.imageUrl,
    this.applyImageRadius = false,
    this.fit,
    this.padding,
    this.isNetworkImage = false,
    this.onTab,
    this.borderRaduis = Sizes.md,
    this.backgroundColor,
    this.border,
  });

  final double? width, height;
  final String imageUrl;
  final bool applyImageRadius;
  final BoxFit? fit;
  final EdgeInsetsGeometry? padding;
  final Color? backgroundColor;
  final bool isNetworkImage;
  final VoidCallback? onTab;
  final double borderRaduis;
  final BoxBorder? border;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTab,
      child: Container(
        width: width,
        height: height,
        padding: padding,
        decoration: BoxDecoration(
            border: border,
            color: backgroundColor,
            borderRadius: BorderRadius.circular(borderRaduis)),
        child: ClipRRect(
          borderRadius: applyImageRadius
              ? BorderRadius.circular(borderRaduis)
              : BorderRadius.zero,
          child: isNetworkImage
              ? CachedNetworkImage(
                  imageUrl: imageUrl,
                  fit: fit,
                  progressIndicatorBuilder: (context, url, downloadProgress) =>
                      TShimmerEffect(
                          width: width ?? 185, height: height ?? 185),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                )
              : Image(
                  image: AssetImage(imageUrl) as ImageProvider,
                  fit: fit,
                  color: backgroundColor),
        ),
      ),
    );
  }
}
