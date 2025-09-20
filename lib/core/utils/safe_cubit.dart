import 'package:flutter_bloc/flutter_bloc.dart';

//TODO: Ver si usar esto
abstract class SafeCubit<State> extends Cubit<State> {
  SafeCubit(super.initialState);

  @override
  void emit(State state) {
    if (!isClosed) {
      super.emit(state);
    }
  }
}
