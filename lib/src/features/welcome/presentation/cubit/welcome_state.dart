part of 'welcome_cubit.dart';

sealed class WelcomeState extends Equatable {
  const WelcomeState();

  @override
  List<Object> get props => <Object>[];
}

final class WelcomeInitial extends WelcomeState {}
