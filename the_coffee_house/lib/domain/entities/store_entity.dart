import 'package:the_coffee_house/domain/entities/location_entity.dart';

class StoreEntity {
  int? id;
  String? puCity;
  String? name;
  String? openTime;
  String? image;
  String? phone;
  LocationEntity? location;
  String? fullAddress;

  StoreEntity({
    this.id,
    this.puCity,
    this.name,
    this.openTime,
    this.image,
    this.phone,
    this.location,
    this.fullAddress,
  });
}
