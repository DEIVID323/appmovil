import 'package:jdphotomap/src/features/map/data/domain/entity/map_position.dart';
import 'package:jdphotomap/src/features/map/data/domain/entity/repository/map_repository.dart';

class MoveToPositionUseCase {
  final MapRepository repository;

  MoveToPositionUseCase(this.repository);

  Future<void> call(MapPosition position) async {
    await repository.moveToPosition(position);
  }
}
