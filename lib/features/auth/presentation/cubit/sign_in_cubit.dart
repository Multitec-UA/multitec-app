import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multitec_app/core/ui/cubit/state_status.dart';
import 'package:multitec_app/features/auth/domain/usecases/sign_in_with_google_usecase.dart';
import 'package:multitec_app/features/auth/presentation/cubit/sign_in_state.dart';

class SignInCubit extends Cubit<SignInState> {
  SignInCubit(this._signInWithGoogle) : super(const SignInState());

  final SignInWithGoogleUseCase _signInWithGoogle;

  Future<void> signInWithGoogle() async {
    if (state.status.isLoading) return;

    emit(state.copyWith(status: StateStatus.loading));

    final result = await _signInWithGoogle.call();

    result.when(
      (user) => emit(
        state.copyWith(
          status: StateStatus.loaded,
          failure: null,
        ),
      ),
      (failure) => emit(
        state.copyWith(
          status: StateStatus.error,
          failure: failure,
        ),
      ),
    );
  }
}
