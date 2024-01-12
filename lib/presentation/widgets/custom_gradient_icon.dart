import 'package:flutter/material.dart';
import 'package:glucare/presentation/core/ui_constants.dart';

class CustomGradientIcon extends StatelessWidget {
  final IconData icon;
  final Color backgroundColor, colorStart, colorEnd;
  final double padding, size;

  const CustomGradientIcon({super.key, required this.icon, required this.backgroundColor, required this.colorStart, required this.colorEnd, required this.padding, required this.size});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(UiConstants.maxRadius),
        color: backgroundColor,
      ),
      child: ShaderMask(
        blendMode: BlendMode.srcIn,
        shaderCallback: (bounds) => LinearGradient(
          colors: [
            colorStart,
            colorEnd,
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ).createShader(bounds),
        child: Icon(
          icon,
          size: size,
        ),
      ),
    );
  }
}
