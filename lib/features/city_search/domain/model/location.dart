class Location {
  const Location({
    required this.latitude,
    required this.longitude,
  });

  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(
      latitude: json['lat'] as double,
      longitude: json['lng'] as double,
    );
  }

  final double latitude;
  final double longitude;
}
