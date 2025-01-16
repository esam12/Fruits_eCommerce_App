import 'package:fruits/features/checkout/domain/entities/shipping_address_entity.dart';

class ShippingAddressModel {
  String? name;
  String? email;
  String? address;
  String? city;
  String? addressDetails;
  String? phoneNumber;

  ShippingAddressModel({
    this.name,
    this.email,
    this.address,
    this.city,
    this.addressDetails,
    this.phoneNumber,
  });

  // toJson
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'address': address,
      'city': city,
      'addressDetails': addressDetails,
      'phoneNumber': phoneNumber,
    };
  }

  // fromEntity
  static ShippingAddressModel fromEntity(ShippingAddressEntity entity) {
    return ShippingAddressModel(
      name: entity.name,
      email: entity.email,
      address: entity.address,
      city: entity.city,
      addressDetails: entity.addressDetails,
      phoneNumber: entity.phoneNumber,
    );
  }

  // Separate method to display shipping address
  String getAddress() {
    return '$address, $city, $addressDetails';
  }
}
