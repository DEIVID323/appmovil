part of 'cobit_cubit.dart';

sealed class CobitState extends Equatable {
  const CobitState();

  @override
  List<Object> get props => <Object>[];
}

final class CobitInitial extends CobitState {}
