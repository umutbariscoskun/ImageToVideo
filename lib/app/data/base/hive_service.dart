// ignore_for_file: comment_references

import 'package:hive_flutter/hive_flutter.dart';

abstract class BaseHiveServiceForList<T> {
  BaseHiveServiceForList(this.key);
  final String key;
  Box<T>? box;
  Future<void> init() async {
    registerAdapters();
    if (!(box?.isOpen ?? false)) {
      box = await Hive.openBox(key);
    }
  }

  /// [Hive.registerAdapter(MyObjectAdapter())]
  /// When you want Hive to use a [TypeAdapter], you have to register it.
  /// Two things are needed for that: An instance of the adapter and a [typeId].
  /// Every type has a unique [typeId] which is used to find the
  /// correct adapter when a value is brought back from disk.
  /// All [typeId]s between 0 and 223 are allowed.
  void registerAdapters();

  Future<void> clearAll() async {
    await box?.clear();
  }

  Future<void> addItems(Iterable<T> items) async {
    await box?.addAll(items);
  }

  Future<void> addItem(T item) async {
    await box?.add(item);
  }

  ///
  /// [await _box?.putAll(Map.fromEntries())]
  ///
  Future<void>? putItems(List<T> items) {
    return box?.putAll(Map.fromEntries(items.asMap().entries));
  }

  List<T>? getItems() {
    return box?.values.toList();
  }

  Stream<BoxEvent>? watch({dynamic key}) {
    return box?.watch(key: key);
  }

  Future<void> deleteAt(int index) async {
    await box?.deleteAt(index);
  }

  Future<void> close() async {
    await box?.close();
  }

  T? getItem(String key) {
    return box?.get(key);
  }

  Future<void> putItem(String key, T item) async {
    return await box?.put(key, item);
  }
}
