import 'package:flutter_test/flutter_test.dart';
import 'package:multitec_app/core/database/openers/sembast_opener.dart';
import 'package:multitec_app/core/database/sembast_database.dart';
import 'package:sembast/sembast_memory.dart';

class MockSembastOpener implements SembastOpener {
  static int _counter = 0;

  @override
  Future<Database> open(String dbName) async {
    // Use unique database name for each test
    return databaseFactoryMemory.openDatabase('${dbName}_${_counter++}');
  }
}

void main() {
  group('SembastDatabase', () {
    late SembastDatabase database;
    const storeName = 'test_store';

    setUp(() {
      database = SembastDatabase(opener: MockSembastOpener());
    });

    tearDown(() async {
      await database.close();
    });

    group('save and get', () {
      test('saves and retrieves data', () async {
        const key = 'test_key';
        final data = {'name': 'John', 'age': 30};

        await database.save(storeName, key, data);
        final result = await database.get(storeName, key);

        expect(result, data);
      });

      test('returns null for non-existent key', () async {
        final result = await database.get(storeName, 'non_existent');

        expect(result, isNull);
      });

      test('overwrites existing data', () async {
        const key = 'test_key';
        final firstData = {'value': 'first'};
        final secondData = {'value': 'second'};

        await database.save(storeName, key, firstData);
        await database.save(storeName, key, secondData);

        final result = await database.get(storeName, key);
        expect(result, secondData);
      });
    });

    group('saveAll', () {
      test('saves multiple items at once', () async {
        final items = {
          'key1': {'name': 'Item 1'},
          'key2': {'name': 'Item 2'},
          'key3': {'name': 'Item 3'},
        };

        await database.saveAll(storeName, items);

        final item1 = await database.get(storeName, 'key1');
        final item2 = await database.get(storeName, 'key2');
        final item3 = await database.get(storeName, 'key3');

        expect(item1, {'name': 'Item 1'});
        expect(item2, {'name': 'Item 2'});
        expect(item3, {'name': 'Item 3'});
      });
    });

    group('getAll', () {
      test('retrieves all items from store', () async {
        // Clear first to ensure clean state
        await database.clear(storeName);

        await database.save(storeName, 'key1', {'value': 1});
        await database.save(storeName, 'key2', {'value': 2});
        await database.save(storeName, 'key3', {'value': 3});

        final result = await database.getAll(storeName);

        expect(result.length, 3);
      });

      test('returns empty list for empty store', () async {
        final result = await database.getAll('empty_store');

        expect(result, isEmpty);
      });

      test('sorts items when sortField is provided', () async {
        await database.save(storeName, 'key1', {'order': 3});
        await database.save(storeName, 'key2', {'order': 1});
        await database.save(storeName, 'key3', {'order': 2});

        final result = await database.getAll(storeName, sortField: 'order');

        expect(result[0]['order'], 1);
        expect(result[1]['order'], 2);
        expect(result[2]['order'], 3);
      });

      test('sorts descending when specified', () async {
        await database.save(storeName, 'key1', {'order': 1});
        await database.save(storeName, 'key2', {'order': 2});
        await database.save(storeName, 'key3', {'order': 3});

        final result = await database.getAll(
          storeName,
          sortField: 'order',
          descending: true,
        );

        expect(result[0]['order'], 3);
        expect(result[1]['order'], 2);
        expect(result[2]['order'], 1);
      });
    });

    group('delete', () {
      test('deletes specific item', () async {
        const key = 'test_key';
        await database.save(storeName, key, {'value': 'test'});

        expect(await database.exists(storeName, key), true);

        await database.delete(storeName, key);

        expect(await database.exists(storeName, key), false);
      });

      test('does not affect other items', () async {
        await database.save(storeName, 'key1', {'value': 1});
        await database.save(storeName, 'key2', {'value': 2});

        await database.delete(storeName, 'key1');

        expect(await database.exists(storeName, 'key1'), false);
        expect(await database.exists(storeName, 'key2'), true);
      });
    });

    group('clear', () {
      test('removes all items from store', () async {
        await database.save(storeName, 'key1', {'value': 1});
        await database.save(storeName, 'key2', {'value': 2});
        await database.save(storeName, 'key3', {'value': 3});

        expect(await database.count(storeName), 3);

        await database.clear(storeName);

        expect(await database.count(storeName), 0);
      });
    });

    group('count', () {
      test('returns correct count of items', () async {
        expect(await database.count(storeName), 0);

        await database.save(storeName, 'key1', {'value': 1});
        expect(await database.count(storeName), 1);

        await database.save(storeName, 'key2', {'value': 2});
        expect(await database.count(storeName), 2);

        await database.delete(storeName, 'key1');
        expect(await database.count(storeName), 1);
      });
    });

    group('exists', () {
      test('returns true for existing key', () async {
        const key = 'test_key';
        await database.save(storeName, key, {'value': 'test'});

        expect(await database.exists(storeName, key), true);
      });

      test('returns false for non-existent key', () async {
        expect(await database.exists(storeName, 'non_existent'), false);
      });
    });

    group('multiple stores', () {
      test('stores are independent', () async {
        const store1 = 'store1';
        const store2 = 'store2';

        await database.save(store1, 'key', {'store': 1});
        await database.save(store2, 'key', {'store': 2});

        final result1 = await database.get(store1, 'key');
        final result2 = await database.get(store2, 'key');

        expect(result1, {'store': 1});
        expect(result2, {'store': 2});
      });
    });

    test('closes without errors', () async {
      await database.close();
      expect(() => database.close(), returnsNormally);
    });
  });
}
