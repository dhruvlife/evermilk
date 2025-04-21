import 'package:get_storage/get_storage.dart';

class StorageObject {
StorageObject._();
  static final GetStorage _storage = GetStorage();

  static void saveData({required String key,required dynamic value}) {
    _storage.write(key, value);
  }

  static dynamic readData(String key) {
    return _storage.read(key);
  }

  static void removeData(String key) {
    _storage.remove(key);
  }

  static void clearStorage() {
    _storage.erase();
  }
}