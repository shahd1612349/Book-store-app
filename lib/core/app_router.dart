import 'package:go_router/go_router.dart';

import '../features/on_boarding/presentation/view/on_boarding_view.dart';
import '../features/splash_screen/view/splash.dart';

abstract class Approuter {
  static final router = GoRouter(
    routes: [

      GoRoute(
        path: '/',
        builder: (context, state) =>  SplashScreen(),
      ),
      GoRoute(
        path: '/OnBoardingView',
        builder: (context, state) => const OnBoardingView(),
      ),


    ],
  );
}