import 'package:dio/dio.dart';
import 'package:multitec_app/core/network/network.dart';

class MultitecApiClient implements MultitecApi {
  MultitecApiClient(this._httpClient);

  final HttpClient _httpClient;

  @override
  String exampleMethod() {
    return 'Example method';
  }

  @override
  Future<Response<T>> exampleMethod2<T>() {
    return _httpClient.get<T>('/example');
  }
}
