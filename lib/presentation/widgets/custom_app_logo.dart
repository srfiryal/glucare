import 'package:flutter/material.dart';
import 'package:glucare/l10n/l10n.dart';

class CustomAppLogo extends StatelessWidget {
  const CustomAppLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset('assets/ic_app.png', width: 48, height: 48),
        const SizedBox(width: 6),
        Text(
          AppLocalizations.of(context).glucare,
          style: Theme.of(context).textTheme.displayLarge,
        ),
      ],
    );
  }
}
