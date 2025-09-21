import 'package:freezed_annotation/freezed_annotation.dart';

part 'example_item.freezed.dart';

@freezed
abstract class ExampleItem with _$ExampleItem {
  const factory ExampleItem({
    required String id,
    required String title,
    String? description,
  }) = _ExampleItem;
}
