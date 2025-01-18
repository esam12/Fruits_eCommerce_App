import 'package:fruits/core/helper/functions/get_currency.dart';
import 'package:fruits/features/checkout/domain/entities/order_entity.dart';

import 'details.dart';

class Amount {
  String? total;
  String? currency;
  DetailsEntity? details;

  Amount({this.total, this.currency, this.details});

  factory Amount.fromEntity(OrderEntity entity) {
    return Amount(
      total: entity.calculateTotalPriceAfterDiscount().toString(),
      currency: getCurrency(),
      details: DetailsEntity.fromEntity(entity),
    );
  }


  toJson() => {
        'total': total,
        'currency': currency,
        'details': details!.toJson(),
      };
}
