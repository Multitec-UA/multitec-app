import 'package:flutter/services.dart';

class ApiKeyProvider {
  static const _channel = MethodChannel('environment_config');

  static Future<void> provideGoogleMapsApiKey() async {
    const apiKey = String.fromEnvironment('GOOGLE_MAPS_API_KEY');
    if (apiKey.isNotEmpty) {
      await _channel.invokeMethod('setGoogleMapsApiKey', apiKey);
    }
  }
}
