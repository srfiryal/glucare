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
    CustomRoute(
        page: RegisterPage,
        path: '/register',
        transitionsBuilder: TransitionsBuilders.fadeIn),
    CustomRoute(
        page: DashboardPage,
        path: '/dashboard',
        transitionsBuilder: TransitionsBuilders.fadeIn),
    CustomRoute(
        page: DiabetesCheckerPage,
        path: '/diabetes_checker',
        transitionsBuilder: TransitionsBuilders.fadeIn),
    CustomRoute(
        page: GlucoseDetailPage,
        path: '/glucose_detail',
        transitionsBuilder: TransitionsBuilders.fadeIn),
    CustomRoute(
        page: BmiDetailPage,
        path: '/bmi_detail',
        transitionsBuilder: TransitionsBuilders.fadeIn),
    CustomRoute(
        page: BloodPressureDetailPage,
        path: '/blood_pressure_detail',
        transitionsBuilder: TransitionsBuilders.fadeIn),
  ],
)
class $AppRouter {}