import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';

class DeviceId {
  final String _key = 'app_unique_device_id';

  Future<String> get() async {
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
