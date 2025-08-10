import 'package:fruits/features/checkout/data/models/order_product_model.dart';
import 'package:fruits/features/checkout/data/models/shipping_address_model.dart';
import 'package:fruits/features/home/domain/entities/cart_entity.dart';
import 'package:fruits/features/home/domain/entities/cart_item_entity.dart';
import 'package:fruits/features/orders/domain/entities/order_entity.dart';
import 'package:uuid/uuid.dart';

class OrderModel {
  final num totalPrice;
  final String uId;
  final ShippingAddressModel shippingAddressModel;
  final List<OrderProductModel> orderProducts;
  final String paymentMethod;
  final String orderId;
  final String status;
  final String date;

  OrderModel({
    required this.totalPrice,
    required this.uId,
    required this.shippingAddressModel,
    required this.orderProducts,
    required this.paymentMethod,
    required this.orderId,
    required this.status,
    required this.date,
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
        orderId: const Uuid().v4(),
        status: 'Pending',
        date: DateTime.now().toString());
  }

  factory OrderModel.fromJson(Map<String, dynamic> json) {
    return OrderModel(
        totalPrice: json['totalPrice'],
        uId: json['uId'],
        shippingAddressModel:
            ShippingAddressModel.fromJson(json['shippingAddressModel']),
        orderProducts: (json['orderProducts'] as List)
            .map<OrderProductModel>((e) => OrderProductModel.fromJson(e))
            .toList(),
        paymentMethod: json['paymentMethod'],
        orderId: json['orderId'],
        status: json['status'],
        date: json['date']);
  }

  OrderEntity toEntity() {
    return OrderEntity(
      cartEntity: CartEntity(
        cartItems:
            orderProducts.map<CartItemEntity>((p) => p.toEntity()).toList(),
      ),
      uID: uId,
      payWithCash: paymentMethod.toLowerCase() == "cash",
    )..shippingAddress = shippingAddressModel.toEntity();
  }

  toJson() {
    return {
      'totalPrice': totalPrice,
      'uId': uId,
      'orderId': orderId,
      'status': status,
      'date': date,
      'shippingAddressModel': shippingAddressModel.toJson(),
      'orderProducts': orderProducts.map((e) => e.toJson()).toList(),
      'paymentMethod': paymentMethod,
    };
  }
}
