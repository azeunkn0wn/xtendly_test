import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:xtendly_test/home/domain/item.dart';
import 'package:xtendly_test/home/infrastructure/item_repository_impl.dart';

part 'items_notifier.freezed.dart';

@freezed
class ItemsState with _$ItemsState {
  const ItemsState._();
  const factory ItemsState.initial(List<Item?> items) = _Initial;
  const factory ItemsState.loadInProgress(List<Item?> items) = _LoadInProgress;
  const factory ItemsState.loadSuccess(
    List<Item?> items,
  ) = _LoadSuccess;
}

class ItemsNotifier extends StateNotifier<ItemsState> {
  final ItemRepositoryImpl _repository;
  ItemsNotifier(this._repository) : super(const ItemsState.initial([]));

  Future<void> loadItems() async {
    state = const ItemsState.loadInProgress([]);
    final items = await _repository.getItems();

    if (!mounted) return;
    state = ItemsState.loadSuccess(items);
  }
}
