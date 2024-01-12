import 'package:flutter/material.dart';
import 'package:glucare/presentation/core/ui_constants.dart';

class CustomShadow extends StatelessWidget {
  final Widget child;
  final bool isBlur;
  final Color? color;

  const CustomShadow({super.key, required this.child, this.isBlur = true, this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(UiConstants.lgRadius),
        boxShadow: [
          if (isBlur) BoxShadow(
            color: color ?? const Color(0x02000000),
            blurRadius: 6.77,
            offset: const Offset(0, 1.46),
            spreadRadius: 0,
          ),
          if (isBlur) BoxShadow(
            color: color ?? const Color(0x03000000),
            blurRadius: 24.85,
            offset: const Offset(0, 4.91),
            spreadRadius: 0,
          ),
          if (isBlur) BoxShadow(
            color: color ?? const Color(0x05000000),
            blurRadius: 80,
            offset: const Offset(0, 22),
            spreadRadius: 0,
          ),
          if (!isBlur) BoxShadow(
            color: color ?? const Color(0xFFDFE0E0),
            blurRadius: 0,
            offset: const Offset(0, -2),
            spreadRadius: 0,
          ),
        ],
      ),
      child: child,
    );
  }
}
