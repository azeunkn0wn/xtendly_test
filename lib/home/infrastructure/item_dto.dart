import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:xtendly_test/home/domain/item.dart';
import 'package:xtendly_test/home/infrastructure/category_dto.dart';

part 'item_dto.freezed.dart';
part 'item_dto.g.dart';

List<CategoryDTO> _categoriesFromJson(Object? json) {
  if (json == null) {
    return [];
  }
  final jsonDecoded = json as List<dynamic>;
  final categories = jsonDecoded
      .map((element) => CategoryDTO.fromJson(element as Map<String, dynamic>))
      .toList();
  return categories;
}

@freezed
class ItemDTO with _$ItemDTO {
  const ItemDTO._();
  const factory ItemDTO({
    required String name,
    required String description,
    required double price,
    double? discount,
    required String image,
    @JsonKey(fromJson: _categoriesFromJson) List<CategoryDTO>? categories,
  }) = _ItemDTO;

  factory ItemDTO.fromJson(Map<String, dynamic> json) =>
      _$ItemDTOFromJson(json);

  Item toDomain() {
    return Item(
      name: name,
      description: description,
      price: price,
      discount: discount,
      image: image,
      categories: categories?.map((e) => e.toDomain()).toList(),
    );
  }
}
