import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multitec_app/core/ui/cubit/request_status.dart';
import 'package:multitec_app/features/auth/domain/enums/autentication_status.dart';
import 'package:multitec_app/features/auth/domain/services/auth_service.dart';
import 'package:multitec_app/features/user/domain/repositories/user_repository.dart';
import 'package:multitec_app/features/user/presentation/cubits/user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit(this._userRepository, this._authService)
    : super(const UserState()) {
    _onAuthStatusChanged = () {
      final status = _authService.status;
      if (status == AuthenticationStatus.authenticated) {
        getUser();
      } else {
        emit(const UserState());
      }
    };
    _authService.statusListenable.addListener(_onAuthStatusChanged!);
    _onAuthStatusChanged!();
  }

  final UserRepository _userRepository;
  final AuthService _authService;
  VoidCallback? _onAuthStatusChanged;

  Future<void> getUser() async {
    if (state.status.isLoading) return;

    emit(state.copyWith(status: RequestStatus.loading));

    final result = _userRepository.getUser();

    result.when(
      (user) => emit(
        state.copyWith(
          status: RequestStatus.success,
          user: user,
          failure: null,
        ),
      ),
      (failure) =>
          emit(state.copyWith(status: RequestStatus.failure, failure: failure)),
    );
  }

  @override
  Future<void> close() {
    if (_onAuthStatusChanged != null) {
      _authService.statusListenable.removeListener(_onAuthStatusChanged!);
    }
    return super.close();
  }
}
