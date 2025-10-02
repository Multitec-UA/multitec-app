import 'package:flutter/material.dart';
import 'package:multitec_app/core/ui/components/appbar/mt_appbar.dart';
import 'package:multitec_app/core/ui/components/lists/mt_list_tile.dart';
import 'package:multitec_app/core/ui/design/foundations/spacings.dart';
import 'package:multitec_app/core/ui/design/theme/app_colors_extension.dart';
import 'package:url_launcher/url_launcher.dart';

class HelpAndFeedbackScreen extends StatelessWidget {
  const HelpAndFeedbackScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.background,
      appBar: const MultitecAppBar(
        showTitleLogo: false,
        title: 'Ayuda y Feedback',
      ),
      body: Padding(
        padding: paddings.all.s16,
        child: Column(
          children: [
            spacings.y.s16,
            MTSettingsTile(
              title: 'Contactar con el desarrollador',
              subtitle: 'Invitar a un café virtual y ponerse en contacto',
              leading: Icon(Icons.coffee, color: context.colors.primaryBase),
              onTap: () async {
                const email = 'davidgab08@gmail.com';
                const subject = 'Te invito a un café';
                const body =
                    '¡Hola! \n\nMe gustaría invitarte a un café virtual para charlar sobre Multitec UA y ponernos en contacto. \n\n¡Espero tu respuesta! \n\nSaludos, [ Tu Nombre ]';
                await _launchEmail(email: email, subject: subject, body: body);
              },
            ),
            spacings.y.s20,
            MTSettingsTile(
              title: 'Reportar un bug / Sugerir una funcionalidad',
              subtitle:
                  'Enviar reporte de errores o solicitar nuevas características',
              leading: Icon(
                Icons.bug_report_rounded,
                color: context.colors.primaryBase,
              ),
              onTap: () async {
                const email = 'davidgab08@gmail.com';
                const subject = 'Reporte de bug o solicitud de funcionalidad';
                const body =
                    'Hola, \n\nHe encontrado un problema en Multitec UA que quiero reportar. Aquí están los detalles: \n[Descripción breve del bug o problema] \n\nDispositivo y versión del sistema operativo: \n[Información del dispositivo y versión del SO] \n\nO, \n\nTengo una idea para una nueva funcionalidad que podría ser genial para Multitec UA: \n[Descripción de la funcionalidad sugerida] \n\nGracias por tu atención. \n\nSaludos, [ Tu Nombre ]';
                await _launchEmail(email: email, subject: subject, body: body);
              },
            ),
          ],
        ),
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
