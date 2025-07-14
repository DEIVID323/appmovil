part of 'app_cubit.dart';

sealed class AppState extends Equatable {
  const AppState();

  @override
  List<Object> get props => <Object>[];
}

final class AppInitial extends AppState {}
