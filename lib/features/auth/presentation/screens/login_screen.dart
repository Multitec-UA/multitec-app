import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multitec_app/core/di/service_locator.dart';
import 'package:multitec_app/core/exceptions/failure_localization.dart';
import 'package:multitec_app/core/ui/components/snack_bar.dart';
import 'package:multitec_app/core/ui/extensions/context_extension.dart';
import 'package:multitec_app/core/ui/styles/spacings.dart';
import 'package:multitec_app/features/auth/domain/usecases/sign_in_with_google_usecase.dart';
import 'package:multitec_app/features/auth/presentation/cubit/login_cubit.dart';
import 'package:multitec_app/features/auth/presentation/cubit/login_state.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (_) => LoginCubit(
          locator<SignInWithGoogleUseCase>(),
        ),
        child: const _Body(),
      ),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state.status.isError) {
          context.showSnackBar(
            AppSnackBar.error(
              content: Text(
                state.failure.toLocalizedMessage(context),
              ),
            ),
          );
        }
      },
      child: SafeArea(
        child: Padding(
          padding: paddings.all.s24,
          child: const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _Logo(),
              SizedBox(height: 48),
              _WelcomeText(),
              SizedBox(height: 48),
              _GoogleSignInButton(),
            ],
          ),
        ),
      ),
    );
  }
}

class _Logo extends StatelessWidget {
  const _Logo();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/pngs/multitec_logo.png'),
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}

class _WelcomeText extends StatelessWidget {
  const _WelcomeText();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      children: [
        Text(
          'Bienvenido a Multitec',
          style: theme.textTheme.headlineMedium?.copyWith(
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 16),
        Text(
          'Inicia sesión para acceder a la comunidad estudiantil',
          style: theme.textTheme.bodyLarge?.copyWith(
            color: theme.colorScheme.onSurface.withValues(alpha: 0.7),
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}

class _GoogleSignInButton extends StatelessWidget {
  const _GoogleSignInButton();

  @override
  Widget build(BuildContext context) {
    final isLoading = context.select<LoginCubit, bool>(
      (c) => c.state.status.isLoading,
    );

    return ElevatedButton.icon(
      onPressed: isLoading
          ? null
          : () => context.read<LoginCubit>().signInWithGoogle(),
      icon: isLoading
          ? const SizedBox(
              width: 20,
              height: 20,
              child: CircularProgressIndicator(strokeWidth: 2),
            )
          : const Icon(Icons.login),
      label:
          Text(isLoading ? 'Iniciando sesión...' : 'Iniciar sesión con Google'),
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 16),
        textStyle: const TextStyle(fontSize: 16),
      ),
    );
  }
}
