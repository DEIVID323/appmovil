import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jdphotomap/src/features/signup/domain/entity/signup_entity.dart';
import 'package:jdphotomap/src/features/signup/domain/usecase/signup_usecase.dart';
import 'package:shared/shared.dart';

part 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  SignupCubit({required SignupUsecase usecase})
    : _usecase = usecase,
      super(const SignupState());
  final SignupUsecase _usecase;

  void signUp({required SignupEntity entity}) async {
    try {
      emit(state.copyWith(status: Status.loading));
      await _usecase.signUp(entity: entity);
    } catch (e) {
      emit(state.copyWith(status: Status.error, message: e.toString()));
    }
  }
}
