import 'package:dio/dio.dart';
import 'package:multitec_app/core/network/network.dart';

class GoogleMapsApiClient implements GoogleMapsApi {
  GoogleMapsApiClient(this._httpClient);

  final HttpClient _httpClient;

  static const String _geocodeJson = '/geocode/json';

  @override
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
