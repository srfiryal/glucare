import 'package:flutter/material.dart';
import 'package:glucare/data/models/check_history/check_history_model.dart';
import 'package:glucare/l10n/l10n.dart';
import 'package:glucare/presentation/core/color_values.dart';
import 'package:glucare/presentation/core/ui_constants.dart';
import 'package:glucare/presentation/widgets/custom_app_bar.dart';
import 'package:glucare/presentation/widgets/custom_date_tab.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sizer/sizer.dart';

import '../../../data/models/date_tab/date_tab_model.dart';
import '../../widgets/custom_gradient_icon.dart';
import '../../widgets/custom_history_card.dart';
import '../../widgets/custom_shadow.dart';

class BloodPressureDetailPage extends StatefulWidget {
  const BloodPressureDetailPage({super.key});

  @override
  State<BloodPressureDetailPage> createState() => _BloodPressureDetailPageState();
}

class _BloodPressureDetailPageState extends State<BloodPressureDetailPage> {
  final List<DateTabModel> _tabs = [
    DateTabModel(value: '120', date: DateTime(2024, 1, 20)),
    DateTabModel(value: '112', date: DateTime(2024, 1, 19)),
    DateTabModel(value: '100', date: DateTime(2024, 1, 18)),
    DateTabModel(value: '120', date: DateTime(2024, 1, 17)),
    DateTabModel(value: '120', date: DateTime(2024, 1, 16)),
    DateTabModel(value: '120', date: DateTime(2024, 1, 15)),
    DateTabModel(value: '120', date: DateTime(2024, 1, 14)),
    DateTabModel(value: '120', date: DateTime(2024, 1, 13)),
  ];
  final List<CheckHistoryModel> _history = [
    CheckHistoryModel(time: DateTime(2024, 20, 1, 18, 0), value: 120, unit: 'mmhg'),
    CheckHistoryModel(time: DateTime(2024, 20, 1, 12, 0), value: 121, unit: 'mmhg'),
  ];
  late DateTabModel _selectedTab;

  @override
  void initState() {
    _selectedTab = _tabs[0];

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            CustomAppBar(
              title: AppLocalizations.of(context).blood_pressure,
            ),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(vertical: UiConstants.mdPadding),
                child: Column(
                  children: [
                    _buildDateTabs(),
                    const SizedBox(height: UiConstants.mdSpacing),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: UiConstants.lgPadding),
                      child: Column(
                        children: [
                          _buildCurrentBloodPressure(),
                          const SizedBox(height: UiConstants.mdSpacing),
                          _buildBloodPressureIndex(),
                          const SizedBox(height: UiConstants.mdSpacing),
                          _buildHistory(),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildDateTabs() {
    return Container(
      width: 100.w,
      height: 88,
      decoration: const BoxDecoration(color: ColorValues.white),
      child: ListView.separated(
          primary: false,
          shrinkWrap: true,
          padding: const EdgeInsets.symmetric(vertical: UiConstants.smPadding, horizontal: UiConstants.lgPadding),
          scrollDirection: Axis.horizontal,
          itemCount: _tabs.length,
          itemBuilder: (context, index) {
            final DateTabModel tab = _tabs[index];
            return CustomDateTab(
              type: 'blood',
              isSelected: _selectedTab == tab,
              onTap: () {
                setState(() {
                  _selectedTab = tab;
                });
              },
              dateTabModel: tab,
            );
          },
          separatorBuilder: (context, index) {
            return const SizedBox(width: UiConstants.smSpacing);
          }
      ),
    );
  }

  Widget _buildCurrentBloodPressure() {
    return CustomShadow(
      child: Container(
        padding: const EdgeInsets.all(UiConstants.smPadding),
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(UiConstants.lgRadius),
          color: ColorValues.white,
        ),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(UiConstants.maxRadius),
                    color: ColorValues.warning10,
                  ),
                  child: Image.asset(
                    'assets/ic_blood_pressure.png',
                    width: 12,
                    height: 12,
                  ),
                ),
                const SizedBox(width: UiConstants.xsSpacing),
                Expanded(
                  child: Text(
                    AppLocalizations.of(context).current_blood_pressure,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const SizedBox(width: UiConstants.mdSpacing),
                const Icon(
                  Iconsax.edit_25,
                  color: ColorValues.grey90,
                  size: 16,
                )
              ],
            ),
            const SizedBox(height: UiConstants.lgSpacing),
            RichText(
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              text: TextSpan(
                text: '120',
                style: Theme.of(context).textTheme.displayLarge,
                children: [
                  TextSpan(
                      text: UiConstants.bloodPressureUnit,
                      style: Theme.of(context).textTheme.bodySmall
                  ),
                ],
              ),
            ),
            const SizedBox(height: UiConstants.xsSpacing),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const CustomGradientIcon(
                    icon: Iconsax.like_15,
                    backgroundColor: ColorValues.success10,
                    colorStart: ColorValues.success30,
                    colorEnd: ColorValues.success50,
                    padding: 2,
                    size: 12
                ),
                const SizedBox(width: UiConstants.xxsSpacing),
                Text(
                  'Normal',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            const SizedBox(height: UiConstants.lgSpacing),
            Text(
              'Updated yesterday',
              style: Theme.of(context).textTheme.labelSmall?.copyWith(color: ColorValues.grey50),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: UiConstants.xxsSpacing),
          ],
        ),
      ),
    );
  }

  Widget _buildBloodPressureIndex() {
    return CustomShadow(
      child: Container(
        padding: const EdgeInsets.all(UiConstants.smPadding),
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(UiConstants.lgRadius),
          color: ColorValues.white,
        ),
        child: Row(
          children: [
            _buildBloodLevel(
                name: AppLocalizations.of(context).hypo,
                value: '<100',
                icon: Iconsax.arrow_circle_down4,
                iconBackground: ColorValues.warning10,
                iconColorStart: ColorValues.warning30,
                iconColorEnd: ColorValues.warning50
            ),
            const SizedBox(width: UiConstants.mdSpacing),
            _buildBloodLevel(
                name: AppLocalizations.of(context).normal,
                value: '>99',
                icon: Iconsax.like_15,
                iconBackground: ColorValues.success10,
                iconColorStart: ColorValues.success30,
                iconColorEnd: ColorValues.success50
            ),
            const SizedBox(width: UiConstants.mdSpacing),
            _buildBloodLevel(
                name: AppLocalizations.of(context).hyper,
                value: '>140',
                icon: Iconsax.arrow_circle_up3,
                iconBackground: ColorValues.danger10,
                iconColorStart: ColorValues.danger30,
                iconColorEnd: ColorValues.danger50
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBloodLevel({required String name, required String value, required IconData icon, required Color iconBackground, required Color iconColorStart, required iconColorEnd}) {
    return Expanded(
        child: Row(
          children: [
            CustomGradientIcon(
                icon: icon,
                backgroundColor: iconBackground,
                colorStart: iconColorStart,
                colorEnd: iconColorEnd,
                padding: 2,
                size: 12
            ),
            const SizedBox(width: UiConstants.xxsSpacing),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: ColorValues.grey50,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 2),
                RichText(
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  text: TextSpan(
                    text: value,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                    children: [
                      TextSpan(
                        text: UiConstants.bloodPressureUnit,
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: ColorValues.grey50,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            )
          ],
        )
    );
  }

  Widget _buildHistory() {
    return CustomShadow(
      child: Container(
        padding: const EdgeInsets.all(UiConstants.smPadding),
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(UiConstants.lgRadius),
          color: ColorValues.white,
        ),
        child: Column(
          children: [
            Row(
              children: [
                const CustomGradientIcon(
                    icon: Iconsax.clock5,
                    backgroundColor: ColorValues.warning10,
                    colorStart: ColorValues.warning30,
                    colorEnd: ColorValues.warning50,
                    padding: 6,
                    size: 12
                ),
                const SizedBox(width: UiConstants.xsSpacing),
                Expanded(
                  child: Text(
                    AppLocalizations.of(context).history,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(height: UiConstants.lgSpacing),
            ListView.separated(
              primary: false,
              shrinkWrap: true,
              itemCount: _history.length,
              itemBuilder: (context, index) {
                return CustomHistoryCard(
                  checkHistoryModel: _history[index],
                  type: 'blood',
                );
              },
              separatorBuilder: (context, index) {
                return const SizedBox(height: UiConstants.smSpacing);
              },
            )
          ],
        ),
      ),
    );
  }
}
