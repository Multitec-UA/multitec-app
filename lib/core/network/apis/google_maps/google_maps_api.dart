import 'package:dio/dio.dart';

// ignore: one_member_abstracts
abstract class GoogleMapsApi {
  Future<Response<T>> getCoordinatesFromAddress<T>({required String address});
}
