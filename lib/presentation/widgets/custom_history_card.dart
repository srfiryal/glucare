import 'package:flutter/material.dart';
import 'package:glucare/application/common/shared_code.dart';
import 'package:glucare/data/models/check_history/check_history_model.dart';
import 'package:glucare/presentation/core/ui_constants.dart';
import 'package:glucare/presentation/widgets/custom_shadow.dart';
import 'package:sizer/sizer.dart';

import '../core/color_values.dart';

class CustomHistoryCard extends StatefulWidget {
  final CheckHistoryModel checkHistoryModel;
  final String type;

  const CustomHistoryCard({super.key, required this.checkHistoryModel, required this.type});

  @override
  State<CustomHistoryCard> createState() => _CustomHistoryCardState();
}

class _CustomHistoryCardState extends State<CustomHistoryCard> {
  late Color _color30, _color50;

  @override
  void initState() {
    switch (widget.type) {
      case 'bmi':
        _color30 = ColorValues.teal30;
        _color50 = ColorValues.teal50;
        break;
      case 'blood':
        _color30 = ColorValues.warning30;
        _color50 = ColorValues.warning50;
        break;
      default:
        _color30 = ColorValues.primary30;
        _color50 = ColorValues.primary50;
        break;
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CustomShadow(
      isBlur: false,
      child: Container(
        width: 100.w,
        padding: const EdgeInsets.symmetric(horizontal: UiConstants.mdSpacing, vertical: 20),
        decoration: BoxDecoration(
          border: Border.all(width: 1, color: ColorValues.grey10),
          borderRadius: BorderRadius.circular(UiConstants.lgRadius),
          color: ColorValues.white,
        ),
        child: Row(
          children: [
            Text(
              SharedCode.formatTime.format(widget.checkHistoryModel.time),
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            if (widget.checkHistoryModel.tag != null) Container(
              padding: const EdgeInsets.symmetric(horizontal: UiConstants.xsPadding, vertical: UiConstants.xxsPadding),
              margin: const EdgeInsets.symmetric(horizontal: UiConstants.xsSpacing),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(UiConstants.maxRadius),
                gradient: LinearGradient(
                  colors: [_color30, _color50],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Text(
                widget.checkHistoryModel.tag!,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(color: ColorValues.white),
              )
            ),
            const Spacer(),
            RichText(
              text: TextSpan(
                text: widget.checkHistoryModel.value.toString(),
                style: Theme.of(context).textTheme.displaySmall?.copyWith(color: _color50),
                children: [
                  TextSpan(
                    text: widget.checkHistoryModel.unit,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(color: _color50),
                  ),
                ],
              )
            )
          ],
        ),
      ),
    );
  }
}
