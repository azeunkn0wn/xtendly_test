import 'dart:convert';

import 'package:xtendly_test/home/domain/item.dart';
import 'package:xtendly_test/home/infrastructure/item_dto.dart';
import 'package:xtendly_test/home/infrastructure/item_remote_service_impl.dart';
import 'package:xtendly_test/home/infrastructure/item_repository.dart';

class ItemRepositoryImpl implements ItemRepository {
  final ItemRemoteServiceImpl _remoteService;

  ItemRepositoryImpl(this._remoteService);
  @override
  Future<List<Item>> getItems() async {
    final json = await _remoteService.getItems();
    final jsonDecoded = await jsonDecode(json) as List<dynamic>;
    if (jsonDecoded.isNotEmpty) {
      final List<Item> items = jsonDecoded
          .map(
            (element) =>
                ItemDTO.fromJson(element as Map<String, dynamic>).toDomain(),
          )
          .toList();

      return items;
    }
    return [];
  }
}
