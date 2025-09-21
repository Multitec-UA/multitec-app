import 'package:flutter/material.dart';
import 'package:multitec_app/features/example/domain/entities/example_item.dart';

class ExampleListItem extends StatelessWidget {
  const ExampleListItem({required this.item, super.key});

  final ExampleItem item;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const CircleAvatar(child: Icon(Icons.label_outline)),
      title: Text(item.title),
      subtitle: item.description != null ? Text(item.description!) : null,
    );
  }
}
