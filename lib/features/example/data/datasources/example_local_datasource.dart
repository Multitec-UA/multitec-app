import 'package:multitec_app/core/database/base_local_datasource.dart';
import 'package:multitec_app/core/database/database_service.dart';
import 'package:multitec_app/features/example/data/dtos/example_item_dto.dart';

class ExampleLocalDataSource extends BaseLocalDataSource<ExampleItemDto> {
  ExampleLocalDataSource(DatabaseService databaseService)
      : super(databaseService, 'example_items');

  Future<List<ExampleItemDto>> fetchItems() async {
    final data = await getAll();
    return data.map((json) => ExampleItemDto.fromJson(json)).toList();
  }

  Future<void> sendReport() async {
    final newItem = ExampleItemDto(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      title: 'Reporte local',
      description: 'Guardado en Sembast DB a ${DateTime.now()}',
    );

    await save(newItem.id, newItem.toJson());
  }

  Future<void> saveItem(ExampleItemDto item) async {
    await save(item.id, item.toJson());
  }

  Future<ExampleItemDto?> getItem(String id) async {
    final data = await get(id);
    if (data == null) return null;
    return ExampleItemDto.fromJson(data);
  }

  Future<void> deleteItem(String id) async {
    await delete(id);
  }

  Future<void> clearAll() async {
    await clear();
  }
}
