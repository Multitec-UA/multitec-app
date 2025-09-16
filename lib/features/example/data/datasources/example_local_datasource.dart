import 'package:multitec_app/core/database/db_stores.dart';
import 'package:multitec_app/core/database/local_database.dart';
import 'package:multitec_app/features/example/data/dtos/example_item_dto.dart';

class ExampleLocalDataSource {
  ExampleLocalDataSource(
    this._db, {
    this.storeName = DbStores.exampleItems,
  });

  final LocalDatabase _db;
  final String storeName;

  Future<List<ExampleItemDto>> fetchItems() async {
    final data = await _db.getAll(storeName);
    return data.map(ExampleItemDto.fromJson).toList();
  }

  Future<void> saveItems(List<ExampleItemDto> items) async {
    final itemsMap = <String, Map<String, Object?>>{};
    for (final item in items) {
      itemsMap[item.id] = item.toJson();
    }
    await _db.saveAll(storeName, itemsMap);
  }
}
