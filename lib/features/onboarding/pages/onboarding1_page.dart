import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Onboarding1Page extends ConsumerWidget {
  const Onboarding1Page({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const Scaffold(
      body: Center(
        child: Text('Onboarding 1'),
      ),
    );
  }
}
