import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multitec_app/core/ui/cubit/state_status.dart';
import 'package:multitec_app/features/auth/domain/enums/autentication_status.dart';
import 'package:multitec_app/features/auth/domain/services/auth_service.dart';
import 'package:multitec_app/features/user/domain/repositories/user_repository.dart';
import 'package:multitec_app/features/user/presentation/cubits/user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit(this._userRepository, this._authService)
      : super(const UserState()) {
    _listenToAuth();
  }

  final UserRepository _userRepository;
  final AuthService _authService;

  void _listenToAuth() {
    _authService.statusStream.listen((status) {
      if (status == AuthenticationStatus.authenticated) {
        getUser();
      } else {
        emit(state.copyWith(user: null, status: StateStatus.initial));
      }
    });
  }

  Future<void> getUser() async {
    if (state.status.isLoading) return;

    emit(state.copyWith(status: StateStatus.loading));

    final result = _userRepository.getUser();

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
