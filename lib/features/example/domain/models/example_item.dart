class ExampleItem {
  const ExampleItem({
    required this.id,
    required this.title,
    this.description,
  });
  final String id;
  final String title;
  final String? description;
}
