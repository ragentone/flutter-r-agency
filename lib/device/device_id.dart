import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';

class DeviceIdManager {
  static const _key = 'app_unique_device_id';

  static Future<String> getOrCreateDeviceId() async {
    final storage = await SharedPreferences.getInstance();
    String? existingId = storage.getString(_key);

    if (existingId != null) {
      return existingId;
    }

    var uuid = const Uuid();
    String newId = uuid.v4();
    await storage.setString(_key, newId);

    return newId;
  }
}
