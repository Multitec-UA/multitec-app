import 'dart:async';
import 'package:multitec_app/features/example/data/dtos/example_item_dto.dart';

abstract class ExampleLocalDataSource {
  Future<List<ExampleItemDto>> fetchItems();
  Future<void> sendReport();
}

// Implementacion de ejemplo (_cache equivale a un Hive, SQLite, etc.)
class ExampleLocalDataSourceImpl implements ExampleLocalDataSource {
  ExampleLocalDataSourceImpl();

  final List<ExampleItemDto> _cache = [];

  @override
  Future<List<ExampleItemDto>> fetchItems() async {
    await Future<void>.delayed(const Duration(milliseconds: 300));
    return List.unmodifiable(_cache);
  }

  @override
  Future<void> sendReport() async {
    await Future<void>.delayed(const Duration(milliseconds: 300));
    _cache.add(
      ExampleItemDto(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        title: 'Reporte local',
        description: 'Guardado en cache local a ${DateTime.now()}',
      ),
    );
  }

  void seed(List<ExampleItemDto> initial) {
    _cache.clear();
    _cache.addAll(initial);
  }
}
