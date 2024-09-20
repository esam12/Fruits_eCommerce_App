import '../../domain/entities/cart_entity.dart';

class CartModel extends CartEntity {
  CartModel({
    required this.id,
    required this.name,
    required this.image,
    required this.price,
    required this.quantity,
  }) : super(
          productId: id,
          productTitle: name,
          productImage: image,
          productPrice: price,
          productQuantity: quantity,
        );

  final String id;
  final String name;
  final String image;
  final double price;
  final int quantity;

  /// Empty cart model
  factory CartModel.empty() {
    return CartModel(
      id: '',
      name: '',
      image: '',
      price: 0.0,
      quantity: 0,
    );
  }

  /// Convert a Cart Model to a json Map
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'image': image,
      'price': price,
      'quantity': quantity,
    };
  }

  /// Convert a json Map to a Cart Model
  factory CartModel.fromJson(Map<String, dynamic> json) {
    return CartModel(
      id: json['id'],
      name: json['name'],
      image: json['image'],
      price: json['price'],
      quantity: json['quantity'],
    );
  }

  /// The copyWith method is used to create a new instance of the Cart Model
  CartModel copyWith({
    String? id,
    String? name,
    String? image,
    double? price,
    int? quantity,
  }) {
    return CartModel(
      id: id ?? this.id,
      name: name ?? this.name,
      image: image ?? this.image,
      price: price ?? this.price,
      quantity: quantity ?? this.quantity,
    );
  }
}
