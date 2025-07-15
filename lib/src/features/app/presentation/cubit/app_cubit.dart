import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jdphotomap/src/features/app/domain/usecase/app_usecase.dart';

part 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit({required AppUsecase usecase})
    : _usecase = usecase,
      super(const AppState());
  final AppUsecase _usecase;
  StreamSubscription<User?>? _authStatusSubscription;

  void init() {
    _authStatusSubscription = _usecase.authStatus().listen(
      _onSucces,
      onError: _onError,
    );
  }

  void _onSucces(User? user) {
    emit(state.copyWith(user: user, status: AppStatus.authenticated));
  }

  void _onError(Object error) {
    emit(state.copyWith(user: null, status: AppStatus.unauthenticated));
  }

  Future<void> signOut() async {
    await _usecase.signOut();
  }

  @override
  Future<void> close() {
    _authStatusSubscription?.cancel();
    return super.close();
  }
}
