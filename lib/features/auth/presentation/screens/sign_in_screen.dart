import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multitec_app/core/di/service_locator.dart';
import 'package:multitec_app/core/exceptions/failure_localization.dart';
import 'package:multitec_app/core/l10n/l10n.dart';
import 'package:multitec_app/core/ui/components/snackbars/snack_bar.dart';
import 'package:multitec_app/core/ui/design/foundations/foundations.dart';
import 'package:multitec_app/core/ui/design/theme/theme.dart';
import 'package:multitec_app/features/auth/domain/usecases/sign_in_with_google_usecase.dart';
import 'package:multitec_app/features/auth/presentation/cubit/sign_in_cubit.dart';
import 'package:multitec_app/features/auth/presentation/cubit/sign_in_state.dart';
import 'package:multitec_app/features/auth/presentation/widgets/privacy_policy_text.dart';
import 'package:multitec_app/features/auth/presentation/widgets/sign_in_form.dart';

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
          showErrorSnackBar(
            context,
            message: state.failure.toLocalizedMessage(context),
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
                const _SignInIntroSection(),
                spacings.y.s32,
                const SignInForm(),
                spacings.y.s24,
                const PrivacyPolicyText(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _SignInIntroSection extends StatelessWidget {
  const _SignInIntroSection();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const _Logo(),
        spacings.y.s32,
        _WelcomeTitle(),
        spacings.y.s12,
        _WelcomeDescription(),
        spacings.y.s24,
        const _DomainNotice(),
      ],
    );
  }
}

class _Logo extends StatelessWidget {
  const _Logo();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/pngs/multitec_logo.png'),
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}

class _WelcomeTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text(
      context.l10n.signInWelcomeTitle,
      textAlign: TextAlign.center,
      style: context.textTheme.headlineSmall?.copyWith(
        fontWeight: FontWeight.w700,
      ),
    );
  }
}

class _WelcomeDescription extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text(
      context.l10n.signInWelcomeDescription,
      textAlign: TextAlign.center,
      style: context.textTheme.bodyLarge?.copyWith(
        color: context.colors.textSecondary,
      ),
    );
  }
}

class _DomainNotice extends StatelessWidget {
  const _DomainNotice();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: paddings.x.s16 + paddings.y.s8,
      decoration: BoxDecoration(
        color: context.colors.gray20,
        borderRadius: AppBorderRadius.br10,
      ),
      child: Text(
        context.l10n.domainRestrictionNotice,
        style: context.textTheme.labelMedium?.copyWith(
          color: context.colors.textSecondary,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
