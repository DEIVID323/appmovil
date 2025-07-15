import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jdphotomap/src/features/login/domain/entity/login_entity.dart';
import 'package:jdphotomap/src/features/login/domain/usecase/login_usecase.dart';
import 'package:shared/shared.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit({required LoginUsecase usecase})
    : _usecase = usecase,
      super(const LoginState());

  final LoginUsecase _usecase;

  void login({required LoginEntity loginEntity}) async {
    try {
      emit(state.copyWith(status: Status.loading));
      await _usecase.login(loginEntity: loginEntity);
    } catch (e) {
      emit(state.copyWith(status: Status.error, message: e.toString()));
    } finally {
      emit(state.copyWith(status: Status.initial));
    }
  }
}
