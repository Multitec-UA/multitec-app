import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sq1_assignment/core/router/app_router.dart';

class NotFoundScreen extends StatelessWidget {
  const NotFoundScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Página no encontrada')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.error_outline, size: 80, color: Colors.red),
            const SizedBox(height: 20),
            const Text(
              '404 - No se encontró la página',
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 12),
            TextButton(
              onPressed: () => context.goNamed(AppRoute.home.name),
              child: const Text('Ir al inicio'),
            ),
          ],
        ),
      ),
    );
  }
}
