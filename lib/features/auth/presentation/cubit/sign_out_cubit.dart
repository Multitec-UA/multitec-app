import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multitec_app/core/ui/cubit/state_status.dart';
import 'package:multitec_app/features/auth/domain/usecases/sign_out_usecase.dart';
import 'package:multitec_app/features/auth/presentation/cubit/sign_out_state.dart';

class SignOutCubit extends Cubit<SignOutState> {
  SignOutCubit(
    this._signOutUseCase,
  ) : super(const SignOutState());

  final SignOutUseCase _signOutUseCase;

  Future<void> signOut() async {
    if (state.status.isLoading) return;

    emit(state.copyWith(status: StateStatus.loading));

    final result = await _signOutUseCase();

    result.when(
      (success) {
        emit(
          state.copyWith(
            status: StateStatus.loaded,
            failure: null,
          ),
        );
      },
      (failure) => emit(
        state.copyWith(
          status: StateStatus.error,
          failure: failure,
        ),
      ),
    );
  }
}
