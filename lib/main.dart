import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:glucare/presentation/core/app_theme_data.dart';
import 'package:glucare/presentation/core/color_values.dart';
import 'package:glucare/presentation/routes/router.gr.dart';
import 'package:intl/intl.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:sizer/sizer.dart';
import 'l10n/l10n.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Intl.defaultLocale = 'en';
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return Sizer(
        builder: (_, __, ___) {
          return GlobalLoaderOverlay(
            useDefaultLoading: false,
            overlayColor: Colors.black.withOpacity(0.2),
            overlayWidgetBuilder: (_) {
              return const Center(
                  child: SpinKitChasingDots(
                    color: ColorValues.primary50,
                    size: 50.0,
                  ));
            },
            child: MaterialApp.router(
              title: 'Glucare',
              routerDelegate: _appRouter.delegate(),
              routeInformationParser: _appRouter.defaultRouteParser(),
              localizationsDelegates: AppLocalizations.localizationsDelegates,
              supportedLocales: AppLocalizations.supportedLocales,
              theme: AppThemeData.getTheme(context),
              debugShowCheckedModeBanner: false,
            ),
          );
        }
    );
  }
}