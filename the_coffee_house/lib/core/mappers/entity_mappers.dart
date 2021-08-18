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

  static ProductEntity toProductEntityFromModel(ProductModel? m) {
    List<ToppingEntity>? _toppings;
    List<SizeEntity>? _sizes;
    var toppingModel = m?.toppings;
    var sizeModel = m?.sizes;
    if (toppingModel?.isNotEmpty == true && sizeModel?.isNotEmpty == true) {
      for (var i = 0; i < toppingModel!.length; i++) {
        _toppings?.add(toToppingEntityFromModel(toppingModel[i]));
      }
      for (var i = 0; i < sizeModel!.length; i++) {
        _sizes?.add(toSizeEntityFromModel(sizeModel[i]));
      }
    } else if (toppingModel?.isNotEmpty == true) {
      for (var i = 0; i < toppingModel!.length; i++) {
        _toppings?.add(toToppingEntityFromModel(toppingModel[i]));
      }
    } else if (sizeModel?.isNotEmpty == true) {
      for (var i = 0; i < sizeModel!.length; i++) {
        _sizes?.add(toSizeEntityFromModel(sizeModel[i]));
      }
    }
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

  static List<ProductEntity>? toListProductEntityFromModels(
      List<ProductModel>? models) {
    return models?.map((e) => toProductEntityFromModel(e)).toList();
  }

  static SectionEntity toSectionEntityFromModels(SectionModel? m) {
    /*var productModel = m?.lstProducts;
    if (productModel?.isNotEmpty == true) {
      _lstProducts = toListProductEntityFromModels(productModel);
    }*/
    return SectionEntity(
      id: m?.id,
      name: m?.name,
      status: m?.status,
    );
  }

  static List<SectionEntity>? toListSectionEntityFromModels(
      List<SectionModel>? models) {
    return models?.map((e) => toSectionEntityFromModels(e)).toList();
  }
}
