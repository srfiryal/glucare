import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sizer/sizer.dart';
import 'package:timeline_tile/timeline_tile.dart';

import '../core/color_values.dart';
import '../core/ui_constants.dart';

class StepCardWidget extends StatelessWidget {
  const StepCardWidget(
      {super.key,
      this.isFirst = false,
      this.isLast = false,
      this.isActive = false,
      required this.title,
      required this.description1,
      required this.description2,
      required this.description3});

  final String title;
  final String description1;
  final String description2;
  final String description3;
  final bool isFirst, isLast, isActive;

  @override
  Widget build(BuildContext context) {
    BorderSide border = BorderSide(color: isActive ? ColorValues.success20 : ColorValues.grey20, width: 1);

    return TimelineTile(
      alignment: TimelineAlign.manual,
      lineXY: 0,
      isFirst: isFirst,
      isLast: isLast,
      indicatorStyle: IndicatorStyle(
        width: 35,
        height: 35,
        indicator: SvgPicture.asset(isActive ? 'assets/ic_tick.svg' : 'assets/ic_pill.svg', fit: BoxFit.contain),
        padding: const EdgeInsets.all(6),
      ),
      endChild: Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.all(UiConstants.smPadding),
        margin: const EdgeInsets.only(
            left: 5, bottom: UiConstants.smSpacing),
        decoration: BoxDecoration(
            color: isActive ? ColorValues.success10 : Colors.white,
            borderRadius: BorderRadius.circular(UiConstants.lgRadius),
            border: Border(
                top: BorderSide(
                  color: isActive ? ColorValues.success20 : ColorValues.grey20,
                  width: 5,
                ),
                left: border,
                right: border,
                bottom: border)),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 1.h),
                  Text('$description1   •   $description2   •   $description3',),
                  SizedBox(height: 0.5.h),
                ],
              ),
            ),
            const Icon(
              Iconsax.arrow_right_3,
              size: 18,
              color: ColorValues.grey90,
            ),
          ],
        ),
      ),
      beforeLineStyle: const LineStyle(
          color: ColorValues.grey10,
          thickness: 2),
      afterLineStyle: const LineStyle(
          color: ColorValues.grey10,
          thickness: 2),
    );
  }
}
