import 'package:xtendly_test/home/domain/item.dart';

abstract class ItemRepository {
  Future<List<Item?>> getItems();
}
