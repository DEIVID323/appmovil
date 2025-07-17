import 'package:jdphotomap/src/features/map/data/domain/entity/map_position.dart';

abstract class MapRepository {
  Future<void> initializeMap();
  Future<void> moveToPosition(MapPosition position);
}
