import 'package:auto_route/auto_route.dart';
import '../pages/screens.dart';

// watch for file changes which will rebuild the generated files:
// dart run build_runner watch

// only generate files once and exit after use:
// dart run build_runner build

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    CustomRoute(
        page: SplashPage,
        path: '/splash',
        initial: true,
        transitionsBuilder: TransitionsBuilders.fadeIn),
    CustomRoute(
        page: LoginPage,
        path: '/login',
        transitionsBuilder: TransitionsBuilders.fadeIn),
  ],
)
class $AppRouter {}