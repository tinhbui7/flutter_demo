import 'package:the_coffee_house/data/models/models.dart';
import 'package:the_coffee_house/domain/entities/entities.dart';

class EntityMappers {
  static SizeEntity toSizeEntityFromModel(SizeModel? m) {
    return SizeEntity(
      name: m?.name,
      extraPay: m?.extraPay,
    );
  }

  static ToppingEntity toToppingEntityFromModel(ToppingModel? m) {
    return ToppingEntity(
      name: m?.name,
      extraPay: m?.extraPay,
    );
  }

  static ProductEntity toProductEntityFromModel(
      ProductModel? m, String? sectionId) {
    List<ToppingEntity> _toppings = [];
    List<SizeEntity> _sizes = [];
    var toppingModel = m?.toppings;
    var sizeModel = m?.sizes;
    if (toppingModel?.isNotEmpty == true && sizeModel?.isNotEmpty == true) {
      for (var i = 0; i < toppingModel!.length; i++) {
        _toppings.add(toToppingEntityFromModel(toppingModel[i]));
      }
      for (var i = 0; i < sizeModel!.length; i++) {
        _sizes.add(toSizeEntityFromModel(sizeModel[i]));
      }
    } else if (toppingModel?.isNotEmpty == true) {
      for (var i = 0; i < toppingModel!.length; i++) {
        _toppings.add(toToppingEntityFromModel(toppingModel[i]));
      }
    } else if (sizeModel?.isNotEmpty == true) {
      for (var i = 0; i < sizeModel!.length; i++) {
        _sizes.add(toSizeEntityFromModel(sizeModel[i]));
      }
    }

    if (sectionId == null) {
      return ProductEntity(
        sectionId: m?.sectionId,
        name: m?.name,
        imageUrl: m?.imageUrl,
        intro: m?.intro,
        sizes: _sizes,
        toppings: _toppings,
        price: m?.price,
        status: m?.status,
      );
    } else if (m?.sectionId == sectionId) {
      return ProductEntity(
        sectionId: m?.sectionId,
        name: m?.name,
        imageUrl: m?.imageUrl,
        intro: m?.intro,
        sizes: _sizes,
        toppings: _toppings,
        price: m?.price,
        status: m?.status,
      );
    }
    return ProductEntity();
  }

  static List<ProductEntity>? toListProductEntityFromModels(
      List<ProductModel>? models,
      {String? sectionId}) {
    return models
        ?.map((e) => toProductEntityFromModel(e, sectionId ?? null))
        .where((element) => element.sectionId != null)
        .toList();
  }

  static SectionEntity toSectionEntityFromModels(SectionModel? mSection,
      {List<ProductModel>? mListProduct}) {
    List<ProductEntity>? _lstProducts =
        toListProductEntityFromModels(mListProduct, sectionId: mSection?.id);

    return SectionEntity(
      id: mSection?.id,
      name: mSection?.name,
      status: mSection?.status,
      lstProduct: _lstProducts,
    );
  }

  static List<SectionEntity>? toListSectionEntityFromModels(
      List<SectionModel>? models) {
    return models?.map((e) => toSectionEntityFromModels(e)).toList();
  }

  static List<SectionEntity>? toListProductBySectionEntityFromModels(
      List<ProductModel>? mProduct, List<SectionModel>? mSection) {
    return mSection
        ?.map((e) => toSectionEntityFromModels(e, mListProduct: mProduct))
        .toList();
  }

  static LocationEntity toLocationEntityFromModel(LocationModel? m) {
    return LocationEntity(
      latitude: m?.latitude,
      longitude: m?.longitude,
    );
  }

  static StoreEntity toStoreEntityFromModel(StoreModel? m) {
    return StoreEntity(
      id: m?.id,
      puCity: m?.puCity,
      name: m?.name,
      openTime: m?.openTime,
      image: m?.image,
      phone: m?.phone,
      location: toLocationEntityFromModel(m?.location),
      fullAddress: m?.fullAddress,
    );
  }

  static List<StoreEntity>? toListStoreEntityFromModels(
      List<StoreModel>? models) {
    return models
        ?.map((e) => toStoreEntityFromModel(e))
        .where((element) => element.id != null)
        .toList();
  }
}
