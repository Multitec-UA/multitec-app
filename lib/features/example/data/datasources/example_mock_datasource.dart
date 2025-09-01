import 'dart:async';
import 'package:multitec_app/features/example/data/datasources/example_remote_datasource.dart';
import 'package:multitec_app/features/example/data/dtos/example_item_dto.dart';

class ExampleMockDataSource implements ExampleRemoteDataSource {
  ExampleMockDataSource();

  @override
  Future<List<ExampleItemDto>> fetchItems() async {
    await Future<void>.delayed(const Duration(seconds: 2));

    return const [
      ExampleItemDto(
        id: '1',
        title: 'Elemento de ejemplo 1',
        description: 'Descripción del elemento 1',
      ),
      ExampleItemDto(
        id: '2',
        title: 'Elemento de ejemplo 2',
        description: 'Descripción del elemento 2',
      ),
      ExampleItemDto(
        id: '3',
        title: 'Elemento de ejemplo 3',
      ),
    ];
  }

  @override
  Future<void> sendReport() async {
    await Future<void>.delayed(const Duration(seconds: 2));
  }
}
