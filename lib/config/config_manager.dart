import 'dart:convert';

import 'package:app/config/config_response.dart';
import 'package:app/device/device_id.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

class ConfigManager {
  static ConfigResponse? config;
  static late String backendUrl;

  static Future<void> loadEnv() async {
    await dotenv.load(fileName: ".env");

    if (kReleaseMode) {
      await dotenv.load(fileName: ".env.prod");
    } else {
      await dotenv.load(fileName: ".env.dev");
    }

    backendUrl = dotenv.get('BACKEND_URL');
  }

  static Future<ConfigResponse> load() async {
    final deviceId = await DeviceIdManager.getOrCreateDeviceId();
    final url = Uri.parse(backendUrl);
    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': 'application/json',
        'x-device-id': deviceId,
      },
    );

    final Map<String, dynamic> decodedJson = jsonDecode(response.body);
    final loaded = ConfigResponse.fromJson(decodedJson);

    config = loaded;

    return loaded;
  }
}
