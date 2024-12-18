import 'package:fruits/core/utils/constants/app_images.dart';

class BottomNavigationBarEntity {
  final String activeImage, inActiveImage;
  final String name;

  const BottomNavigationBarEntity({
    required this.activeImage,
    required this.inActiveImage,
    required this.name,
  });
}

List<BottomNavigationBarEntity> get bottomNavigationBarItems => [
      const BottomNavigationBarEntity(
        activeImage: Assets.imagesVuesaxBoldHome,
        inActiveImage: Assets.imagesVuesaxOutlineHome,
        name: 'الرئيسية',
      ),
      const BottomNavigationBarEntity(
        activeImage: Assets.imagesVuesaxBoldProducts,
        inActiveImage: Assets.imagesVuesaxOutlineProducts,
        name: 'المنتجات',
      ),
      const BottomNavigationBarEntity(
        activeImage: Assets.imagesVuesaxBoldShoppingCart,
        inActiveImage: Assets.imagesVuesaxOutlineShoppingCart,
        name: 'سلة التسوق',
      ),
      const BottomNavigationBarEntity(
        activeImage: Assets.imagesVuesaxBoldUser,
        inActiveImage: Assets.imagesVuesaxOutlineUser,
        name: 'حسابي',
      ),
    ];
