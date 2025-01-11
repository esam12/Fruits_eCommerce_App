import 'package:fruits/features/checkout/domain/entities/shipping_address_entity.dart';
import 'package:fruits/features/home/domain/entities/cart_item_entity.dart';

class OrderEntity {
  final List<CartItemEntity> cartItems;
  final bool payMethod;
  final ShippingAddressEntity shippingAddress;

  OrderEntity({
    required this.cartItems,
    required this.payMethod,
    required this.shippingAddress,
  });
}
