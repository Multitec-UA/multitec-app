import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multitec_app/core/ui/cubit/state_status.dart';
import 'package:multitec_app/features/user/domain/repositories/user_repository.dart';
import 'package:multitec_app/features/user/presentation/cubits/user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit(this._userRepository) : super(const UserState());
  final UserRepository _userRepository;

  Future<void> getUser() async {
    if (state.status.isLoading) return;

    emit(state.copyWith(status: StateStatus.loading));

    final result = await _userRepository.getUser();

    result.when(
      (user) => emit(
        state.copyWith(
          status: StateStatus.loaded,
          user: user,
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
