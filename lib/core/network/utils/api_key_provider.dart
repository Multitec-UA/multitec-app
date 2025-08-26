import 'package:flutter/services.dart';

class ApiKeyChannel {
  static const _channel = MethodChannel('environment_config');

  static Future<void> provideKey({
    required String apiKey,
    required String method,
  }) async {
    if (apiKey.isNotEmpty) {
      await _channel.invokeMethod(method, {'apiKey': apiKey});
    }
  }
}
