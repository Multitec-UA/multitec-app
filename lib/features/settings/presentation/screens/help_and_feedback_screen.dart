import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:multitec_app/core/ui/theme/theme_provider.dart';
import 'package:url_launcher/url_launcher.dart';

class HelpAndFeedbackScreen extends StatelessWidget {
  const HelpAndFeedbackScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ayuda y Feedback'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: context.pop,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16),
            _OptionListTile(
              title: 'Contactar con el desarrollador',
              icon: Icons.coffee,
              onPress: () async {
                const email = 'davidgab08@gmail.com';
                const subject = 'Te invito a un café';
                const body =
                    '¡Hola! \n\nMe gustaría invitarte a un café virtual para charlar sobre My Movie Hub y ponernos en contacto. \n\n¡Espero tu respuesta! \n\nSaludos, [ Tu Nombre ]';
                await _launchEmail(email: email, subject: subject, body: body);
              },
            ),
            const SizedBox(height: 20),
            _OptionListTile(
              title: 'Reportar un bug / Sugerir una funcionalidad',
              icon: Icons.bug_report_rounded,
              onPress: () async {
                const email = 'davidgab08@gmail.com';
                const subject = 'Reporte de bug o solicitud de funcionalidad';
                const body =
                    'Hola, \n\nHe encontrado un problema en My Movie Hub que quiero reportar. Aquí están los detalles: \n[Descripción breve del bug o problema] \n\nDispositivo y versión del sistema operativo: \n[Información del dispositivo y versión del SO] \n\nO, \n\nTengo una idea para una nueva funcionalidad que podría ser genial para My Movie Hub: \n[Descripción de la funcionalidad sugerida] \n\nGracias por tu atención. \n\nSaludos, [ Tu Nombre ]';
                await _launchEmail(email: email, subject: subject, body: body);
              },
            ),
          ],
        ),
      ),
    );
  }
}

class _OptionListTile extends StatelessWidget {
  const _OptionListTile({
    required this.title,
    required this.icon,
    required this.onPress,
    super.key,
  });

  final String title;
  final IconData icon;
  final VoidCallback onPress;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ListTile(
      onTap: onPress,
      title: Text(
        title,
        style:
            theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600),
      ),
      leading: CircleAvatar(
        backgroundColor: context.colors.gray10,
        child: Icon(icon, color: theme.colorScheme.secondary),
      ),
      trailing: Icon(
        Icons.arrow_forward_ios_rounded,
        size: 18,
        color: theme.colorScheme.secondary,
      ),
    );
  }
}

Future<void> _launchEmail({
  required String email,
  required String subject,
  required String body,
}) async {
  final uri = Uri.parse(
    'mailto:${Uri.encodeComponent(email)}?subject=${Uri.encodeComponent(subject)}&body=${Uri.encodeComponent(body)}',
  );
  await launchUrl(uri);
}
