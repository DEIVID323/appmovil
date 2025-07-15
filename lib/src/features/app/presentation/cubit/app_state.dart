part of 'app_cubit.dart';

enum AppStatus { initial, authenticated, unauthenticated }

class AppState extends Equatable {
  const AppState({this.user, this.status = AppStatus.initial});
  final User? user;
  final AppStatus status;

  AppState copyWith({User? user, AppStatus? status}) {
    return AppState(user: user ?? this.user, status: status ?? this.status);
  }

  @override
  List<Object?> get props => <Object?>[user, status];
}
