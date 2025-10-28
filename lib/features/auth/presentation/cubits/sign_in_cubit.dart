import 'package:multitec_app/core/ui/cubit/request_status.dart';
import 'package:multitec_app/core/utils/safe_cubit.dart';
import 'package:multitec_app/features/auth/domain/usecases/sign_in_with_google_usecase.dart';
import 'package:multitec_app/features/auth/presentation/cubit/sign_in_state.dart';

class SignInCubit extends SafeCubit<SignInState> {
  SignInCubit(this._signInWithGoogle) : super(const SignInState());

  final SignInWithGoogleUseCase _signInWithGoogle;

  Future<void> signInWithGoogle() async {
    if (state.status.isLoading) return;

    emit(state.copyWith(status: RequestStatus.loading));

    final result = await _signInWithGoogle.call();

    result.when(
      (user) =>
          emit(state.copyWith(status: RequestStatus.success, failure: null)),
      (failure) =>
          emit(state.copyWith(status: RequestStatus.failure, failure: failure)),
    );
  }
}
