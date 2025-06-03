import 'package:dio/dio.dart';

class GeocodeResource {
  GeocodeResource(this._httpClient);

  final Dio _httpClient;

  static const String _geocodeJson = '/geocode/json';

  Future<Response<T>> getCoordinatesFromAddress<T>({
    required String address,
  }) async {
    return _httpClient.get<T>(
      _geocodeJson,
      queryParameters: {
        'address': address,
      },
    );
  }
}
