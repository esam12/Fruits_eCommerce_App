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

  // from json
  static ShippingAddressModel fromJson(Map<String, dynamic> json) {
    return ShippingAddressModel(
      name: json['name'] ?? '',
      email: json['email'] ?? '',
      address: json['address'] ?? '',
      city: json['city'] ?? '',
      addressDetails: json['addressDetails'] ?? '',
      phoneNumber: json['phoneNumber'] ?? '',
    );
  }

  ShippingAddressEntity toEntity() {
    return ShippingAddressEntity(
      name: name,
      email: email,
      address: address,
      city: city,
      addressDetails: addressDetails,
      phoneNumber: phoneNumber,
    );
  }

  // Separate method to display shipping address
  String getAddress() {
    return '$address, $city, $addressDetails';
  }
}
