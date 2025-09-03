import 'package:multitec_app/core/network/network.dart';

class MultitecApiClient extends NetworkService {
  MultitecApiClient._({
    super.interceptors,
  }) : super(
          baseUrl: MultitecApiConfig.baseUrl,
          timeout: MultitecApiConfig.timeout,
        );

  static Future<MultitecApiClient> create() async {
    final interceptors = await MultitecApiConfig.getInterceptors();
    return MultitecApiClient._(interceptors: interceptors);
  }
}
