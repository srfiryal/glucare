import 'package:flutter/material.dart';
import 'package:glucare/presentation/core/color_values.dart';
import 'package:glucare/presentation/core/ui_constants.dart';

class CustomElevatedButton extends StatelessWidget {
  final VoidCallback onPressed;
  final Widget child;

  const CustomElevatedButton({super.key, required this.onPressed, required this.child});

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [
            ColorValues.primary30,
            ColorValues.primary50,
          ],
          begin: Alignment(-0.71, 0.71),
          end: Alignment(0.71, -0.71),
          transform: GradientRotation(45),
        ),
        borderRadius: BorderRadius.circular(UiConstants.lgRadius),
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        child: child,
      ),
    );
  }
}
