
class Location {
  final double longitude;
  final double latitude;

  Location({required this.longitude, required this.latitude});

  Map<String, dynamic> toJson() =>
      {'longitude': longitude, 'latitude': latitude};
}
