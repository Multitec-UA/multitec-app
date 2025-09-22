import 'package:flutter/material.dart';
import 'package:multitec_app/core/ui/components/lists/section_header.dart';
import 'package:multitec_app/core/ui/styles/spacings.dart';

class SettingsSection extends StatelessWidget {
  const SettingsSection({
    required this.title,
    required this.children,
    this.topSpacing = true,
    this.bottomSpacing = true,
    super.key,
  });

  final String title;
  final List<Widget> children;
  final bool topSpacing;
  final bool bottomSpacing;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GroupedSectionHeader(
          title: title,
          topSpacing: topSpacing,
          bottomSpacing: bottomSpacing,
        ),
        Padding(
          padding: paddings.x.s16,
          child: Column(children: children),
        ),
      ],
    );
  }
}
