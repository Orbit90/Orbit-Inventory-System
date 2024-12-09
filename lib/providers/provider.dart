import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';

class Provider<T> with ChangeNotifier {
  final Box<T> _box;

  Provider(String boxName) : _box = Hive.box<T>(boxName);

  List<T> get all => _box.values.toList();

  Future<void> add(T item) async {
    await _box.add(item);
    notifyListeners();
  }

  Future<void> update(int index, T item) async {
    await _box.putAt(index, item);
    notifyListeners();
  }

  Future<void> delete(int index) async {
    await _box.deleteAt(index);
    notifyListeners();
  }

  Future<void> clear() async {
    await _box.clear();
    notifyListeners();
  }
}

