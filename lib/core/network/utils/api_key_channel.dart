import 'package:flutter/services.dart';
import 'package:multitec_app/core/constants/api_constants.dart';

class ApiKeyChannel {
  static const _channel = MethodChannel(ApiConstants.apiKeyChannelName);

  static Future<void> provideKey({
    required String apiKey,
    required String method,
  }) async {
    if (apiKey.isNotEmpty) {
      await _channel.invokeMethod(method, {'apiKey': apiKey});
    }
  }
}
