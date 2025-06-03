import 'package:dio/dio.dart';

class CityResource {
  CityResource(this._httpClient);

  final Dio _httpClient;

  static const String _city = '/city';

  Future<Response<T>> getCities<T>({
    String? name,
    String? include,
    int? page,
  }) async {
    return _httpClient.get<T>(
      _city,
      queryParameters: {
        'filter[0][name][contains]': name,
        'include': include,
        'page': page,
      },
    );
  }
}
