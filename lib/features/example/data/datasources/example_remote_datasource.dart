import 'package:multitec_app/core/network/network.dart';
import 'package:multitec_app/features/example/data/dtos/example_item_dto.dart';

abstract class ExampleRemoteDataSource {
  Future<List<ExampleItemDto>> fetchItems();
  Future<void> sendReport();
}

class ExampleRemoteDataSourceImpl implements ExampleRemoteDataSource {
  ExampleRemoteDataSourceImpl(this._client);

  final HttpClient _client;

  @override
  Future<List<ExampleItemDto>> fetchItems() async {
    final raw = await _client.get<List<dynamic>>('/example/items');

    final list = raw
        .cast<Map<String, dynamic>>()
        .map(ExampleItemDto.fromJson)
        .toList(growable: false);

    return list;
  }

  @override
  Future<void> sendReport() async {
    await _client.post<void>(
      '/example/report',
      data: <String, dynamic>{
        'sentAt': DateTime.now().toIso8601String(),
      },
    );
  }
}
