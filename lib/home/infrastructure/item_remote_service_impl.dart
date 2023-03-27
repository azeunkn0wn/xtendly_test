import 'package:flutter/services.dart';
import 'package:xtendly_test/home/infrastructure/item_remote_service.dart';

class ItemRemoteServiceImpl implements ItemRemoteService {
  @override
  Future<String> getItems() async {
    await Future.delayed(const Duration(seconds: 2)); // simulate network delay
    const assetsPath = 'assets/items.json';
    final result = await rootBundle.loadString(assetsPath);
    return result;
  }
}
