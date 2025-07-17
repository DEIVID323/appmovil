import 'package:jdphotomap/src/features/map/data/domain/entity/repository/map_repository.dart';

class InitMapUseCase {
  final MapRepository repository;

  InitMapUseCase(this.repository);

  Future<void> call() async {
    await repository.initializeMap();
  }
}
