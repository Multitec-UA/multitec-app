import 'package:dio/dio.dart';
import 'package:multitec_app/core/network/apis/google_maps/google_maps_api_config.dart';
import 'package:multitec_app/core/network/network_service.dart';

class GoogleMapsApiClient extends NetworkService {
  GoogleMapsApiClient._({super.interceptors})
    : super(
        baseUrl: GoogleMapsApiConfig.baseUrl,
        timeout: GoogleMapsApiConfig.timeout,
      );

  static Future<GoogleMapsApiClient> create() async {
    final interceptors = await GoogleMapsApiConfig.getInterceptors();
    return GoogleMapsApiClient._(interceptors: interceptors);
  }

  static const String _geocodeJson = '/geocode/json';

  Future<Response<T>> getCoordinatesFromAddress<T>({
    required String address,
  }) async {
    return get<T>(_geocodeJson, queryParameters: {'address': address});
  }
}
