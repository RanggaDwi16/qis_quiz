import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:qis_quiz/extensions/build_context_ext.dart';
import 'package:qis_quiz/helpers/widgets/buttons.dart';
import 'package:qis_quiz/helpers/widgets/custom_text_field.dart';
import 'package:qis_quiz/routers/router_name.dart';

class EnterNamePage extends HookConsumerWidget {
  const EnterNamePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final nameController = useTextEditingController();
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: context.deviceWidth,
              child: Image.asset(
                'assets/logo_qis.png',
              ),
            ),
            const Gap(20),
            CustomTextField(
              controller: nameController,
              labelText: 'Name',
              hintText: 'Masukkan Nama Anda',
            ),
            const Gap(20),
            Button.filled(
                onPressed: () {
                  context.pushNamed(RouteName.waitingRoom);
                },
                label: 'Join Quiz'),
          ],
        ),
      ),
    );
  }
}
