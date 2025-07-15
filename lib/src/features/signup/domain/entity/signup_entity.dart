import 'package:equatable/equatable.dart';

class SignupEntity extends Equatable {
  const SignupEntity({
    required this.username,
    required this.email,
    required this.password,
  });

  final String username;
  final String email;
  final String password;

  SignupEntity copyWith({String? username, String? email, String? password}) {
    return SignupEntity(
      username: username ?? this.username,
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }

  const SignupEntity.empty() : username = '', email = '', password = '';

  @override
  List<Object?> get props => <Object?>[username, email, password];
}
