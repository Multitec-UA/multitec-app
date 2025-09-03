import 'package:dio/dio.dart';
import 'package:multitec_app/core/network/network.dart';

class GoogleMapsApiClient extends NetworkService implements GoogleMapsApi {
  GoogleMapsApiClient._({
    super.interceptors,
  }) : super(
          baseUrl: GoogleMapsApiConfig.baseUrl,
          timeout: GoogleMapsApiConfig.timeout,
        );

  static Future<GoogleMapsApiClient> create() async {
    final interceptors = await GoogleMapsApiConfig.getInterceptors();
    return GoogleMapsApiClient._(interceptors: interceptors);
  }

  static const String _geocodeJson = '/geocode/json';

  @override
  Future<Response<T>> getCoordinatesFromAddress<T>({
    required String address,
  }) async {
    return get<T>(
      _geocodeJson,
      queryParameters: {
        'address': address,
      },
    );
  }
}
