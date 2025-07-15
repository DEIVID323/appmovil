part of 'login_cubit.dart';

class LoginState extends Equatable {
  const LoginState({this.message = '', this.status = Status.initial});

  final Status status;
  final String message;

  LoginState copyWith({Status? status, String? message}) {
    return LoginState(
      status: status ?? this.status,
      message: message ?? this.message,
    );
  }

  @override
  List<Object> get props => <Object>[status, message];
}
