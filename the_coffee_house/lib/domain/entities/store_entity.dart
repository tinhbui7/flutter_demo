import 'package:the_coffee_house/domain/entities/location_entity.dart';

class StoreEntity {
  final int? id;
  final String? puCity;
  final String? name;
  final String? openTime;
  final String? image;
  final String? phone;
  final LocationEntity? location;
  final String? fullAddress;

  const StoreEntity({
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
