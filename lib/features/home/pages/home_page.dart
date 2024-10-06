import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:qis_quiz/extensions/build_context_ext.dart';
import 'package:gap/gap.dart';
import 'package:qis_quiz/helpers/widgets/buttons.dart';
import 'package:qis_quiz/helpers/widgets/custom_text_field.dart';
import 'package:qis_quiz/routers/go_router_provider.dart';
import 'package:qis_quiz/routers/router_name.dart';

class HomePage extends HookConsumerWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final codeController = useTextEditingController();
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
            controller: codeController,
            labelText: 'Code',
            hintText: 'Masukkan Kode Quiz',
          ),
          const Gap(20),
          Button.filled(
              onPressed: () {
                context.pushNamed(RouteName.enterName);
              },
              label: 'Join Quiz'),
          const Gap(20),
          Button.outlined(
            onPressed: () {},
            icon: const Icon(Icons.info_outline_rounded),
            label: 'Petunjuk Permainan',
          )
        ],
      ),
    ));
  }
}
