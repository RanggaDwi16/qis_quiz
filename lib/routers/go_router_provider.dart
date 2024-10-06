import 'package:qis_quiz/features/home/pages/enter_name_page.dart';
import 'package:qis_quiz/features/home/pages/home_page.dart';
import 'package:qis_quiz/features/onboarding/pages/onboarding1_page.dart';
import 'package:qis_quiz/features/onboarding/pages/onboarding2_page.dart';
import 'package:qis_quiz/features/onboarding/pages/onboarding3_page.dart';
import 'package:qis_quiz/features/onboarding/pages/onboarding4_page.dart';
import 'package:qis_quiz/features/onboarding/pages/onboarding5_page.dart';
import 'package:qis_quiz/features/waiting_room/pages/waiting_room_page.dart';
import 'package:qis_quiz/routers/router_name.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:go_router/go_router.dart';

part 'go_router_provider.g.dart';

@Riverpod(keepAlive: true)
Raw<GoRouter> router(RouterRef ref) {
  return GoRouter(
    initialLocation: RouteName.home,
    debugLogDiagnostics: false,
    routes: [
      GoRoute(
        path: '/',
        name: RouteName.home,
        builder: (context, state) => const HomePage(),
      ),
      GoRoute(
        path: '/enter-name',
        name: RouteName.enterName,
        builder: (context, state) => const EnterNamePage(),
      ),
      GoRoute(
        path: '/waiting-room',
        name: RouteName.waitingRoom,
        builder: (context, state) => const WaitingRoomPage(),
      ),
      GoRoute(
        path: '/onboarding1',
        name: RouteName.onboarding1,
        builder: (context, state) => const Onboarding1Page(),
      ),
      GoRoute(
        path: '/onboarding2',
        name: RouteName.onboarding2,
        builder: (context, state) => const Onboarding2Page(),
      ),
      GoRoute(
        path: '/onboarding13',
        name: RouteName.onboarding3,
        builder: (context, state) => const Onboarding3Page(),
      ),
      GoRoute(
        path: '/onboarding4',
        name: RouteName.onboarding4,
        builder: (context, state) => const Onboarding4Page(),
      ),
      GoRoute(
        path: '/onboarding5',
        name: RouteName.onboarding5,
        builder: (context, state) => const Onboarding5Page(),
      ),
    ],
  );
}
