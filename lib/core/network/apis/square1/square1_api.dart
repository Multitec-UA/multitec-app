import 'package:dio/dio.dart';
import 'package:multitec_app/core/network/network.dart';

abstract class Square1Api {
  Future<Response<T>> getCities<T>({String? name, String? include, int? page});

  PaginationMeta paginationMetaFromJson(Map<String, dynamic> json);
}
