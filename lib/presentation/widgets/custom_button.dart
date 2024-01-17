import 'package:flutter/material.dart';
import 'package:glucare/presentation/core/color_values.dart';
import 'package:glucare/presentation/core/ui_constants.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final bool isOutlined;

  const CustomButton({super.key, required this.onPressed, required this.text, this.isOutlined = false});

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [
            ColorValues.primary30,
            ColorValues.primary50,
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          transform: GradientRotation(45),
        ),
        borderRadius: BorderRadius.circular(UiConstants.lgRadius),
      ),
      child: isOutlined
      ? OutlinedButton(
        onPressed: onPressed,
        child: Text(text),
      )
      : ElevatedButton(
        onPressed: onPressed,
        child: Text(text),
      ),
    );
  }
}
