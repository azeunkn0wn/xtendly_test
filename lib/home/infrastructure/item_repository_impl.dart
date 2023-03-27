import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:xtendly_test/home/domain/item.dart';
import 'package:xtendly_test/home/infrastructure/item_repository.dart';

class ItemRepositoryImpl implements ItemRepository {
  @override
  Future<List<Item>> getItems() async {
    await Future.delayed(const Duration(seconds: 2)); // simulate network delay
    const assetsPath = 'assets/items.json';
    final jsonDecoded = await rootBundle
        .loadString(assetsPath)
        .then((value) => jsonDecode(value) as List<Map<String, dynamic>>);

    final items = jsonDecoded.map((element) => Item.fromJson(element)).toList();
    return items;
  }
}
