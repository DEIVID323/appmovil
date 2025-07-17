import 'package:jdphotomap/src/features/map/data/domain/entity/map_position.dart';
import 'package:jdphotomap/src/features/map/data/domain/entity/repository/map_repository.dart';
import 'package:mapbox_maps_flutter/mapbox_maps_flutter.dart';

class MapRepositoryImpl implements MapRepository {
  final MapboxMap map;

  MapRepositoryImpl({required this.map});

  @override
  Future<void> initializeMap() async {
    // Lógica para inicializar el mapa, si se requiere.
  }

  @override
  Future<void> moveToPosition(MapPosition position) async {
    await map.flyTo(
      CameraOptions(
        center: Point(
          coordinates: Position(position.longitude, position.latitude),
        ),
        zoom: position.zoom,
      ),
      MapAnimationOptions(duration: 1500),
    );
  }
}
