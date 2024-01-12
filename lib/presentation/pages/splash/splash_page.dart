import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:glucare/presentation/routes/router.gr.dart';
import 'package:glucare/presentation/widgets/custom_app_logo.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {

  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3), () {
      AutoRouter.of(context).replace(const LoginRoute());
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: CustomAppLogo()),
    );
  }
}
