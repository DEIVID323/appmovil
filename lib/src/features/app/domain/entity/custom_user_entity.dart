import 'package:equatable/equatable.dart';

class CustomUserEntity extends Equatable {
  const CustomUserEntity({required this.email, required this.name});

  final String email;
  final String name;

  @override
  List<Object?> get props => <Object?>[email, name];
}
