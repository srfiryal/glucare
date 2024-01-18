import 'package:flutter/material.dart';
import 'package:glucare/application/common/shared_code.dart';
import 'package:glucare/data/models/date_tab/date_tab_model.dart';
import 'package:glucare/presentation/core/color_values.dart';
import 'package:glucare/presentation/core/ui_constants.dart';
import 'package:sizer/sizer.dart';

class CustomDateTab extends StatefulWidget {
  final VoidCallback? onTap;
  final String type;
  final DateTabModel dateTabModel;
  final bool isSelected;

  const CustomDateTab({super.key, this.onTap, required this.type, required this.dateTabModel, required this.isSelected});

  @override
  State<CustomDateTab> createState() => _CustomDateTabState();
}

class _CustomDateTabState extends State<CustomDateTab> {
  late Color _color30, _color40, _color50, _color60;

  void _getColor() {
    if (widget.isSelected) {
      switch (widget.type) {
        case 'bmi':
          _color30 = ColorValues.teal30;
          _color40 = ColorValues.teal40;
          _color50 = ColorValues.teal50;
          _color60 = ColorValues.teal60;
          break;
        case 'blood':
          _color30 = ColorValues.warning30;
          _color40 = ColorValues.warning40;
          _color50 = ColorValues.warning50;
          _color60 = ColorValues.warning60;
          break;
        case 'medication':
          _color30 = ColorValues.danger30;
          _color40 = ColorValues.danger40;
          _color50 = ColorValues.danger50;
          _color60 = ColorValues.danger60;
          break;
        default:
          _color30 = ColorValues.primary30;
          _color40 = ColorValues.primary40;
          _color50 = ColorValues.primary50;
          _color60 = ColorValues.primary60;
          break;
      }
    } else {
      _color30 = ColorValues.surface;
      _color40 = ColorValues.grey10;
      _color50 = ColorValues.grey10;
      _color60 = ColorValues.grey10;
    }
  }

  @override
  Widget build(BuildContext context) {
    _getColor();

    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        width: 48,
        height: 64,
        padding: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          color: _color30,
          borderRadius: BorderRadius.circular(UiConstants.smRadius),
          border: Border.all(width: 1, color: _color40),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              decoration: BoxDecoration(
                color: _color50,
                borderRadius: BorderRadius.circular(UiConstants.xsRadius),
                border: Border.all(width: 1, color: _color60),
              ),
              child: Text(
                widget.dateTabModel.value,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.labelLarge!.copyWith(color: widget.isSelected ? ColorValues.white : null),
              ),
            ),
            Text(
              SharedCode.formatTab.format(widget.dateTabModel.date),
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodySmall!.copyWith(color: widget.isSelected ? ColorValues.white : null),
            )
          ],
        ),
      ),
    );
  }
}
