class MapPosition {
  final double latitude;
  final double longitude;
  final double zoom;

  MapPosition({
    required this.latitude,
    required this.longitude,
    this.zoom = 14.0,
  });
}
