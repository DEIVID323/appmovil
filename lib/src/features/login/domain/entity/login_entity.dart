import 'package:equatable/equatable.dart';

class LoginEntity extends Equatable {
  const LoginEntity({required this.email, required this.password});
  final String email;
  final String password;

  LoginEntity copyWith({String? email, String? password}) {
    return LoginEntity(
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }

  const LoginEntity.empty() : email = '', password = '';

  @override
  List<Object?> get props => <Object?>[email, password];
}
