import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:glucare/presentation/core/ui_constants.dart';
import 'package:iconsax/iconsax.dart';

import '../core/color_values.dart';

class CustomInfoCard extends StatelessWidget {
  final String title, description, image;
  final Color startColor, endColor;
  final VoidCallback? onTap;
  final bool hasArrowIcon;

  const CustomInfoCard({super.key, required this.title, required this.description, required this.image, required this.startColor, required this.endColor, this.onTap, this.hasArrowIcon = false});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap ?? () {},
      child: Container(
        padding: const EdgeInsets.all(UiConstants.smPadding),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(UiConstants.lgRadius),
          gradient: LinearGradient(
            colors: [
              startColor,
              endColor,
            ],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(UiConstants.smPadding),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(UiConstants.maxRadius),
                color: endColor,
              ),
              child: Image.asset(
                image,
                width: 24,
                height: 24,
              ),
            ),
            const SizedBox(width: UiConstants.xsSpacing),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                      color: ColorValues.white,
                    ),
                  ),
                  const SizedBox(height: UiConstants.xxsSpacing),
                  Text(
                    description,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: ColorValues.primary10,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: UiConstants.mdSpacing),
            if (hasArrowIcon) const Icon(
              Iconsax.arrow_right_3,
              color: ColorValues.white,
              size: 24,
            ),
          ],
        ),
      ),
    );
  }
}
