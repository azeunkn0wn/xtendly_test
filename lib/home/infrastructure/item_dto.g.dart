// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ItemDTO _$$_ItemDTOFromJson(Map<String, dynamic> json) => _$_ItemDTO(
      name: json['name'] as String,
      description: json['description'] as String,
      price: (json['price'] as num).toDouble(),
      discount: (json['discount'] as num?)?.toDouble(),
      image: json['image'] as String,
      categories: _categoriesFromJson(json['categories']),
    );

Map<String, dynamic> _$$_ItemDTOToJson(_$_ItemDTO instance) =>
    <String, dynamic>{
      'name': instance.name,
      'description': instance.description,
      'price': instance.price,
      'discount': instance.discount,
      'image': instance.image,
      'categories': instance.categories,
    };
