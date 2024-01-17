import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:glucare/presentation/widgets/custom_shadow.dart';
import 'package:iconsax/iconsax.dart';

import '../core/color_values.dart';
import '../core/ui_constants.dart';

class CustomAppBar extends StatelessWidget {
  final String title;
  final Widget? action;

  const CustomAppBar({super.key, required this.title, this.action});

  @override
  Widget build(BuildContext context) {
    return CustomShadow(
      child: Container(
          padding: const EdgeInsets.symmetric(vertical: UiConstants.smPadding, horizontal: UiConstants.lgPadding),
          decoration: const BoxDecoration(
            color: ColorValues.surface,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () {
                  AutoRouter.of(context).pop();
                },
                child: CustomShadow(
                  child: Container(
                    width: 48,
                    height: 48,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(UiConstants.maxRadius),
                      color: ColorValues.white,
                    ),
                    child: const Icon(
                      Iconsax.arrow_left,
                      size: 24,
                      color: ColorValues.grey90,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: UiConstants.xxsSpacing),
              Expanded(
                child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      text: '// ',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: ColorValues.grey50),
                      children: [
                        TextSpan(
                          text: title,
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                      ],
                    )
                ),
              ),
              const SizedBox(width: UiConstants.xxsSpacing),
              action ?? GestureDetector(
                onTap: () {},
                child: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                      border: Border.all(color: ColorValues.primary10, width: 2),
                      borderRadius: BorderRadius.circular(UiConstants.lgRadius),
                      image: const DecorationImage(
                        image: CachedNetworkImageProvider('https://images.unsplash.com/photo-1539571696357-5a69c17a67c6?q=80&w=1000&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTJ8fHlvdW5nJTIwbWFufGVufDB8fDB8fHww'),
                        fit: BoxFit.cover,
                      )
                  ),
                ),
              )
            ],
          )
      ),
    );
  }
}
