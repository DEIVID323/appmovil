part of 'signup_cubit.dart';

class SignupState extends Equatable {
  const SignupState({this.status = Status.initial, this.message});
  final Status status;
  final String? message;

  SignupState copyWith({Status? status, String? message}) {
    return SignupState(
      status: status ?? this.status,
      message: message ?? this.message,
    );
  }

  @override
  List<Object?> get props => <Object?>[status, message];
}
