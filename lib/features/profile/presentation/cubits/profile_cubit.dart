import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multitec_app/core/ui/cubit/state_status.dart';
import 'package:multitec_app/features/auth/domain/usecases/sign_out_usecase.dart';
import 'package:multitec_app/features/profile/presentation/cubits/profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit(this._signOutUseCase) : super(const ProfileState());

  final SignOutUseCase _signOutUseCase;

  Future<void> signOut() async {
    if (state.status.isLoading) return;

    emit(state.copyWith(status: StateStatus.loading));

    final result = await _signOutUseCase();

    result.when(
      (success) => emit(
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
