import 'package:fruits/features/checkout/domain/entities/shipping_address_entity.dart';
import 'package:fruits/features/home/domain/entities/cart_entity.dart';

class OrderEntity {
  final String uID;
  final CartEntity cartEntity;
  bool? payWithCash;
  ShippingAddressEntity shippingAddress = ShippingAddressEntity();

  OrderEntity({
    required this.cartEntity,
    this.payWithCash,
    required this.uID,
  });
}
