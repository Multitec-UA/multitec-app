class Country {
  const Country({
    required this.id,
    required this.name,
    required this.code,
  });

  factory Country.fromJson(Map<String, dynamic> json) {
    return Country(
      id: json['id'] as int,
      name: json['name'] as String,
      code: json['code'] as String,
    );
  }

  final int id;
  final String name;
  final String code;
}
