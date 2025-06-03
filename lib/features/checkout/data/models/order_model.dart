import 'package:fruits/features/checkout/data/models/order_product_model.dart';
import 'package:fruits/features/checkout/data/models/shipping_address_model.dart';
import 'package:fruits/features/checkout/domain/entities/order_entity.dart';
import 'package:uuid/uuid.dart';

class OrderModel {
  final num totalPrice;
  final String uId;
  final ShippingAddressModel shippingAddressModel;
  final List<OrderProductModel> orderProducts;
  final String paymentMethod;
  final String orderId;

  OrderModel({
    required this.totalPrice,
    required this.uId,
    required this.shippingAddressModel,
    required this.orderProducts,
    required this.paymentMethod,
    required this.orderId,
  });

  factory OrderModel.fromEntity(OrderEntity orderEntity) {
    return OrderModel(
        totalPrice: orderEntity.cartEntity.calculateTotalPrice(),
        uId: orderEntity.uID,
        shippingAddressModel:
            ShippingAddressModel.fromEntity(orderEntity.shippingAddress),
        orderProducts: orderEntity.cartEntity.cartItems
            .map((e) => OrderProductModel.fromEntity(cartItemEntity: e))
            .toList(),
        paymentMethod: orderEntity.payWithCash! ? 'Cash' : 'PayPal',
        orderId: const Uuid().v4());
  }

  toJson() {
    return {
      'totalPrice': totalPrice,
      'uId': uId,
      'orderId': orderId,
      'status': 'Pending',
      'date': DateTime.now().toString(),
      'shippingAddressModel': shippingAddressModel.toJson(),
      'orderProducts': orderProducts.map((e) => e.toJson()).toList(),
      'paymentMethod': paymentMethod,
    };
  }
}
