import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits/core/services/get_it_service.dart';
import 'package:fruits/core/utils/constants/app_colors.dart';
import 'package:fruits/core/utils/constants/app_text_styles.dart';
import 'package:fruits/core/utils/constants/sizes.dart';
import 'package:fruits/core/widgets/containers/circular_image.dart';
import 'package:fruits/core/widgets/custom_app_bar.dart';
import 'package:fruits/features/orders/presentation/views/orders_view.dart';
import 'package:fruits/features/profile/presentation/manager/profile/profile_cubit.dart';
import 'package:fruits/features/profile/presentation/views/about_us_view.dart';
import 'package:fruits/features/profile/presentation/views/widgets/profile_widget.dart';
import 'package:iconsax/iconsax.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final items = [
      {'title': 'الحساب الشخصي', 'icon': Iconsax.user},
      {'title': 'طلباتي', 'icon': Iconsax.shopping_cart},
      {'title': 'المفضلة', 'icon': Iconsax.heart},
      {'title': 'الاشعارات', 'icon': Iconsax.notification},
      {'title': 'اللغة', 'icon': Iconsax.language_circle},
      {'title': 'الوضع', 'icon': Iconsax.moon},
    ];
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Header Section
          buildAppBar(context,
              title: 'حسابي', showBackButton: false, showNotification: false),

          const SizedBox(
            height: Sizes.md,
          ),

          Row(
            children: [
              Stack(
                children: [
                  const CircularImage(
                    image: "assets/images/avatar.png",
                    width: 115,
                    height: 115,
                    imageHeight: 115,
                    imageWidth: 115,
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    left: 0,
                    child: Container(
                      width: 30,
                      height: 30,
                      decoration: const BoxDecoration(
                        color: AppColors.whiteColor,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Iconsax.camera,
                        color: AppColors.primaryColor,
                      ),
                    ),
                  )
                ],
              ),
              const Expanded(
                child: ListTile(
                  title: Text(
                    'عصام الزعبي',
                    style: TextStyles.bold13,
                  ),
                  subtitle: Text(
                    'isam@gmail.com',
                    style: TextStyles.regular13,
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(
            height: Sizes.md,
          ),

          const Padding(
            padding: EdgeInsets.symmetric(horizontal: Sizes.md),
            child: Text('عام', style: TextStyles.semiBold13),
          ),

          const SizedBox(
            height: Sizes.md,
          ),
          Column(
            children: items.map((item) {
              return ListTile(
                leading: Icon(item['icon'] as IconData,
                    color: AppColors.primaryColor),
                title:
                    Text(item['title'].toString(), style: TextStyles.regular13),
                trailing: const Icon(Icons.arrow_forward_ios_rounded,
                    color: AppColors.primaryColor),
                onTap: () {
                  _handleTap(item['title'].toString(), context);
                },
              );
            }).toList(),
          ),
          const SizedBox(
            height: Sizes.md,
          ),

          const Padding(
            padding: EdgeInsets.symmetric(horizontal: Sizes.md),
            child: Text('المساعدة', style: TextStyles.semiBold13),
          ),

          const SizedBox(
            height: Sizes.md,
          ),

          ListTile(
            leading: const Icon(
              Iconsax.info_circle,
              color: AppColors.primaryColor,
            ),
            title: const Text('من نحن', style: TextStyles.regular13),
            trailing: const Icon(Icons.arrow_forward_ios_rounded,
                color: AppColors.primaryColor),
            onTap: () {
              _handleTap('من نحن', context);
            },
          )
        ],
      ),
    );
  }

  void _handleTap(String title, BuildContext? context) {
    switch (title) {
      case 'الحساب الشخصي':
        Navigator.push(
          context!,
          MaterialPageRoute(
            builder: (_) => BlocProvider(
              create: (context) => ProfileCubit(getIt())..loadUserData(),
              child: const ProfileWidget(),
            ),
          ),
        );
        break;

      case 'طلباتي':
        Navigator.push(
          context!,
          MaterialPageRoute(builder: (_) => const OrdersView()),
        );
        break;

      case 'من نحن':
        Navigator.push(
          context!,
          MaterialPageRoute(builder: (_) => const AboutUsView()),
        );
        break;
      default:
        print('Unknown item tapped');
    }
  }
}
