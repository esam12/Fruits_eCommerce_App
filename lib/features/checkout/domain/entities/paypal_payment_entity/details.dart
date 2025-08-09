import 'package:fruits/features/orders/domain/entities/order_entity.dart';

class DetailsEntity {
  String? subtotal;
  String? shipping;
  num? shippingDiscount;

  DetailsEntity({this.subtotal, this.shipping, this.shippingDiscount});

  Map<String, dynamic> toJson() => {
        'subtotal': subtotal,
        'shipping': shipping,
        'shipping_discount': shippingDiscount,
      };

  factory DetailsEntity.fromEntity(OrderEntity entity) => DetailsEntity(
        subtotal: entity.cartEntity.calculateTotalPrice().toString(),
        shipping: entity.calculateShippingCost().toString(),
        shippingDiscount: entity.calculateShippingDiscount(),
      );
}
