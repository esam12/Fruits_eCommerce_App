import 'package:fruits/core/entities/product_entity.dart';

ProductEntity getDummyProduct() {
  return ProductEntity(
    name: 'Apple',
    code: '123',
    description: 'Fresh apple',
    price: 2.5,
    reviews: [],
    expirationsMonths: 6,
    numberOfCalories: 100,
    unitAmount: 1,
    isOrganic: true,
    isFeatured: true,
    imageUrl: null,
    averageRating: 4.5,
    ratingCount: 10,
  );
}

List<ProductEntity> getDummyProducts() {
  return [
    getDummyProduct(),
    getDummyProduct(),
    getDummyProduct(),
    getDummyProduct(),
    getDummyProduct(),
  ];
}
