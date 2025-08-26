import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multitec_app/core/ui/cubit/state_status.dart';
import 'package:multitec_app/features/example/domain/usecases/fetch_example_items_usecase.dart';
import 'package:multitec_app/features/example/domain/usecases/send_report_usecase.dart';
import 'package:multitec_app/features/example/presentation/cubit/example_state.dart';

class ExampleCubit extends Cubit<ExampleState> {
  ExampleCubit(this._fetch, this._send) : super(const ExampleState());

  final FetchExampleItemsUseCase _fetch;
  final SendReportUseCase _send;

  Future<void> loadExampleItems() async {
    emit(state.copyWith(listStatus: StateStatus.loading));

    final result = await _fetch();

    result.when(
      (items) => emit(
        state.copyWith(
          listStatus: StateStatus.loaded,
          items: items,
          listFailure: null,
        ),
      ),
      (failure) => emit(
        state.copyWith(
          listStatus: StateStatus.error,
          listFailure: failure,
        ),
      ),
    );
  }

  Future<void> sendReport() async {
    if (state.reportStatus.isLoading) return;
    emit(state.copyWith(reportStatus: StateStatus.loading));

    final result = await _send();

    result.when(
      (_) => emit(
        state.copyWith(
          reportStatus: StateStatus.loaded,
        ),
      ),
      (failure) => emit(
        state.copyWith(
          reportStatus: StateStatus.error,
          reportFailure: failure,
        ),
      ),
    );
  }
}
