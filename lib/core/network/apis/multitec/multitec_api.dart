import 'package:dio/dio.dart';

abstract class MultitecApi {
  String exampleMethod();
  Future<Response<T>> exampleMethod2<T>();
}
