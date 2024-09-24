class ProductEntity {
  final String productId;
  final String productName;
  final num productPrice;
  final String productImage;
  String? productDescription;
  num? productRating;
  num? productRatingCount;
  num? productCalories;

  ProductEntity({
    required this.productName,
    required this.productPrice,
    required this.productImage,
    required this.productId,
    this.productDescription,
    this.productRating,
    this.productRatingCount,
    this.productCalories,
  });
}
