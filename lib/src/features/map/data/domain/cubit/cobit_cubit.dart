import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'cobit_state.dart';

class CobitCubit extends Cubit<CobitState> {
  CobitCubit() : super(CobitInitial());
}
