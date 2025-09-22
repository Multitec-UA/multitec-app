import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multitec_app/core/di/service_locator.dart';
import 'package:multitec_app/core/exceptions/failure_localization.dart';
import 'package:multitec_app/core/ui/components/snackbars/snack_bar.dart';
import 'package:multitec_app/core/ui/extensions/context_extension.dart';
import 'package:multitec_app/core/ui/styles/spacings.dart';
import 'package:multitec_app/features/auth/domain/usecases/sign_in_with_google_usecase.dart';
import 'package:multitec_app/features/auth/presentation/cubit/sign_in_cubit.dart';
import 'package:multitec_app/features/auth/presentation/cubit/sign_in_state.dart';
import 'package:multitec_app/features/auth/presentation/widgets/sign_in_footer.dart';
import 'package:multitec_app/features/auth/presentation/widgets/sign_in_form.dart';
import 'package:multitec_app/features/auth/presentation/widgets/sign_in_header.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (_) => SignInCubit(locator<SignInWithGoogleUseCase>()),
        child: const SafeArea(child: _Body()),
      ),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignInCubit, SignInState>(
      listenWhen: (prev, curr) => prev.status != curr.status,
      listener: (context, state) {
        if (state.status.isFailure) {
          context.showSnackBar(
            AppSnackBar.error(
              content: Text(state.failure.toLocalizedMessage(context)),
            ),
          );
        }
      },
      child: Center(
        child: SingleChildScrollView(
          padding: paddings.x.s24,
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 400),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SignInHeader(),
                spacings.y.s32,
                const SignInForm(),
                spacings.y.s24,
                const SignInFooter(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
