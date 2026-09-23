import 'dart:convert';

import 'package:app/config/config_response.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

import '../device/device_id.dart';

class ConfigService {
  static ConfigResponse? config;
  late String backendUrl;

  Future<void> loadEnv() async {
    await dotenv.load(fileName: ".env");

    if (kReleaseMode) {
      await dotenv.load(fileName: ".env.prod");
    } else {
      await dotenv.load(fileName: ".env.dev");
    }

    backendUrl = dotenv.get('BACKEND_URL');
  }

  Future<ConfigResponse> load() async {
    final deviceId = await DeviceId().get();
    final url = Uri.parse(backendUrl);

    print(deviceId);
    print(url.toString());

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
