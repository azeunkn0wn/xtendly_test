import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:xtendly_test/home/application/items_notifier.dart';
import 'package:xtendly_test/home/infrastructure/item_remote_service_impl.dart';
import 'package:xtendly_test/home/infrastructure/item_repository_impl.dart';

final itemRemoteService = Provider<ItemRemoteServiceImpl>(
  (ref) => ItemRemoteServiceImpl(),
);

final itemRepositoryProvider = Provider(
  (ref) => ItemRepositoryImpl(
    ref.watch(itemRemoteService),
  ),
);
final itemsNotifierProvider = StateNotifierProvider<ItemsNotifier, ItemsState>(
  (ref) => ItemsNotifier(ref.watch(itemRepositoryProvider)),
);
