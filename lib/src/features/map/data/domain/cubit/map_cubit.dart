import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'map_state.dart';

class CobitCubit extends Cubit<CobitState> {
  CobitCubit() : super(CobitInitial());
}
