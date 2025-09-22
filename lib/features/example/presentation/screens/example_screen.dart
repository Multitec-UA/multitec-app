import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multitec_app/core/di/service_locator.dart';
import 'package:multitec_app/core/exceptions/failure.dart';
import 'package:multitec_app/core/exceptions/failure_localization.dart';
import 'package:multitec_app/core/l10n/l10n.dart';
import 'package:multitec_app/core/ui/components/appbar/mt_appbar.dart';
import 'package:multitec_app/core/ui/components/snackbars/snack_bar.dart';
import 'package:multitec_app/core/ui/cubit/request_status.dart';
import 'package:multitec_app/core/ui/extensions/context_extension.dart';
import 'package:multitec_app/core/ui/styles/spacings.dart';
import 'package:multitec_app/features/example/domain/usecases/fetch_example_items_usecase.dart';
import 'package:multitec_app/features/example/domain/usecases/send_report_usecase.dart';
import 'package:multitec_app/features/example/presentation/cubit/example_cubit.dart';
import 'package:multitec_app/features/example/presentation/cubit/example_state.dart';
import 'package:multitec_app/features/example/presentation/widgets/example_list_error_placeholder.dart';
import 'package:multitec_app/features/example/presentation/widgets/example_list_item.dart';

class ExampleScreen extends StatelessWidget {
  const ExampleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MultitecAppBar(showTitleLogo: false),
      body: BlocProvider(
        create: (_) => ExampleCubit(
          locator<FetchExampleItemsUseCase>(),
          locator<SendReportUseCase>(),
        )..loadExampleItems(),
        child: const _Body(),
      ),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    return BlocListener<ExampleCubit, ExampleState>(
      listenWhen: (prev, curr) => prev.reportStatus != curr.reportStatus,
      listener: (context, state) {
        if (state.reportStatus.isSuccess) {
          context.showSnackBar(
            AppSnackBar.success(
              content: const Text('Informe enviado correctamente'),
            ),
          );
        } else if (state.reportStatus.isFailure) {
          context.showSnackBar(
            AppSnackBar.error(
              content: Text(state.reportFailure.toLocalizedMessage(context)),
            ),
          );
        }
      },
      child: const Column(
        children: [
          _SendReportButton(),
          Divider(height: 1),
          Expanded(child: _ListSection()),
        ],
      ),
    );
  }
}

class _SendReportButton extends StatelessWidget {
  const _SendReportButton();

  @override
  Widget build(BuildContext context) {
    final isSending = context.select<ExampleCubit, bool>(
      (c) => c.state.reportStatus.isLoading,
    );

    return Padding(
      padding: paddings.all.s16,
      child: SizedBox(
        width: double.infinity,
        child: ElevatedButton.icon(
          onPressed: isSending
              ? null
              : () => context.read<ExampleCubit>().sendReport(),
          icon: const Icon(Icons.send),
          label: Text(isSending ? 'Enviando…' : 'Enviar informe'),
        ),
      ),
    );
  }
}

class _ListSection extends StatelessWidget {
  const _ListSection();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ExampleCubit, ExampleState>(
      buildWhen: (p, c) =>
          p.listStatus != c.listStatus ||
          p.items != c.items ||
          p.listFailure != c.listFailure,
      builder: (context, state) {
        return switch (state.listStatus) {
          RequestStatus.initial || RequestStatus.loading => const Center(
            child: CircularProgressIndicator(),
          ),

          RequestStatus.failure => ExampleListErrorPlaceholder(
            message: state.listFailure.toExampleListMessage(context),
            onRetry: () => context.read<ExampleCubit>().loadExampleItems(),
          ),

          RequestStatus.success when state.items.isEmpty => const Center(
            child: Text('No hay elementos disponibles'),
          ),

          RequestStatus.success => RefreshIndicator(
            onRefresh: () => context.read<ExampleCubit>().loadExampleItems(),
            child: ListView.separated(
              physics: const AlwaysScrollableScrollPhysics(),
              itemCount: state.items.length,
              itemBuilder: (_, i) => ExampleListItem(item: state.items[i]),
              separatorBuilder: (_, __) => const Divider(height: 1),
            ),
          ),
        };
      },
    );
  }
}

// Mapper especifico de la vista para failures
extension _ExampleListFailureL10nX on Failure? {
  String toExampleListMessage(BuildContext context) {
    final l10n = context.l10n;
    if (this == null) return l10n.genericError;

    return switch (this) {
      NetworkFailure _ =>
        'No se ha podido obtener la lista debido a un fallo de conexión',
      TimeoutFailure _ =>
        'No se ha podido obtener la lista porque ha tardado demasiado',
      _ => toLocalizedMessage(context),
    };
  }
}
