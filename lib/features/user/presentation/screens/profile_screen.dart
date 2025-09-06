import 'package:flutter/material.dart';
import 'package:multitec_app/core/ui/components/appbar/mt_appbar.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: MultitecAppBar(),
      body: Center(
        child: Text('Profile'),
      ),
    );
  }
}
