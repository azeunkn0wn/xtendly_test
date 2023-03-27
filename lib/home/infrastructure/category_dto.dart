import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:xtendly_test/home/domain/category.dart';
part 'category_dto.freezed.dart';
part 'category_dto.g.dart';

@freezed
class CategoryDTO with _$CategoryDTO {
  const CategoryDTO._();
  const factory CategoryDTO({
    required String name,
  }) = _CategoryDTO;

  factory CategoryDTO.fromJson(Map<String, dynamic> json) =>
      _$CategoryDTOFromJson(json);

  Category toDomain() {
    return Category(name: name);
  }
}
