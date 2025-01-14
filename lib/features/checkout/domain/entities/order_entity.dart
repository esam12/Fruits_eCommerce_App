import 'package:fruits/features/checkout/domain/entities/shipping_address_entity.dart';
import 'package:fruits/features/home/domain/entities/cart_entity.dart';

class OrderEntity {
  final CartEntity cartEntity;
  bool? payWithCash;
  final ShippingAddressEntity? shippingAddress;

  OrderEntity({
    required this.cartEntity,
    this.payWithCash,
    this.shippingAddress,
  });
}
