import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:xtendly_test/home/domain/category.dart';
part 'item.freezed.dart';

@freezed
class Item with _$Item {
  const Item._();
  const factory Item({
    required String name,
    required String description,
    required double price,
    double? discount,
    required String image,
    List<Category>? categories,
  }) = _Item;
}
