import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class ILocalStorage {
  Future<String?> read({required String key});
  Future<void> write({required String key, required String value});
  Future<void> delete({required String key});
}

@Injectable(as: ILocalStorage)
class SharedPrefStorage implements ILocalStorage {
  @override
  Future<String?> read({required String key}) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(key);
  }

  @override
  Future<void> write({required String key, required String value}) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(key, value);
  }

  @override
  Future<void> delete({required String key}) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove(key);
  }
}
