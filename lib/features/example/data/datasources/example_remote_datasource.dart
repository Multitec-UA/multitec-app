import 'package:multitec_app/core/network/network.dart';
import 'package:multitec_app/features/example/data/dtos/example_item_dto.dart';

abstract class ExampleRemoteDataSource {
  Future<List<ExampleItemDto>> fetchItems();
  Future<void> sendReport();
}

class ExampleRemoteDataSourceImpl implements ExampleRemoteDataSource {
  ExampleRemoteDataSourceImpl(this._client);

  final NetworkService _client;

  @override
  Future<List<ExampleItemDto>> fetchItems() async {
    final response = await _client.get<List<dynamic>>('/example/items');

    final list = response.data!
        .map((e) => ExampleItemDto.fromJson(e as Map<String, dynamic>))
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
