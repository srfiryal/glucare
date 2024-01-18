import 'dart:ffi';

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

class BmiDetailPage extends StatefulWidget {
  const BmiDetailPage({super.key});

  @override
  State<BmiDetailPage> createState() => _BmiDetailPageState();
}

class _BmiDetailPageState extends State<BmiDetailPage> {
  final List<DateTabModel> _tabs = [
    DateTabModel(value: '24.1', date: DateTime(2024, 1, 20)),
    DateTabModel(value: '24.1', date: DateTime(2024, 1, 19)),
    DateTabModel(value: '24.1', date: DateTime(2024, 1, 18)),
    DateTabModel(value: '24.1', date: DateTime(2024, 1, 17)),
    DateTabModel(value: '24.1', date: DateTime(2024, 1, 16)),
    DateTabModel(value: '24.1', date: DateTime(2024, 1, 15)),
    DateTabModel(value: '24.1', date: DateTime(2024, 1, 14)),
    DateTabModel(value: '24.1', date: DateTime(2024, 1, 13)),
  ];
  final List<CheckHistoryModel> _history = [
    CheckHistoryModel(time: DateTime(2024, 20, 1, 18, 0), value: 180, tag: 'Height', unit: 'cm'),
    CheckHistoryModel(time: DateTime(2024, 20, 1, 12, 0), value: 75, tag: 'Weight', unit: 'kg'),
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
              title: AppLocalizations.of(context).body_mass_index,
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
                          _buildCurrentBmi(),
                          const SizedBox(height: UiConstants.mdSpacing),
                          _buildWeightHeight(),
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
              type: 'bmi',
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

  Widget _buildCurrentBmi() {
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
                    color: ColorValues.teal10,
                  ),
                  child: Image.asset(
                    'assets/ic_bmi.png',
                    width: 12,
                    height: 12,
                  ),
                ),
                const SizedBox(width: UiConstants.xsSpacing),
                Expanded(
                  child: Text(
                    AppLocalizations.of(context).current_bmi,
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
                text: '24.1',
                style: Theme.of(context).textTheme.displayLarge,
                children: [
                  TextSpan(
                      text: UiConstants.bmiUnit,
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
                  'Healthy Weight',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            const SizedBox(height: UiConstants.lgSpacing),
            Text(
              'Updated just now',
              style: Theme.of(context).textTheme.labelSmall?.copyWith(color: ColorValues.grey50),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: UiConstants.xxsSpacing),
          ],
        ),
      ),
    );
  }

  Widget _buildWeightHeight() {
    return Row(
      children: [
        Expanded(
          child: _buildIndexCard(
            title: AppLocalizations.of(context).weight,
            value: 76,
            unit: 'kg',
            onTap: () {},
          ),
        ),
        const SizedBox(width: UiConstants.mdSpacing),
        Expanded(
          child: _buildIndexCard(
            title: AppLocalizations.of(context).height,
            value: 178,
            unit: 'cm',
            onTap: () {},
          ),
        ),
      ],
    );
  }

  Widget _buildIndexCard({required String title, required double value, required String unit, required VoidCallback onTap}) {
    return CustomShadow(
      isBlur: false,
      child: Container(
        padding: const EdgeInsets.all(UiConstants.mdPadding),
        width: double.infinity,
        decoration: BoxDecoration(
          border: Border.all(color: ColorValues.grey10, width: 1),
          borderRadius: BorderRadius.circular(UiConstants.lgRadius),
          color: ColorValues.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    title,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ),
                const SizedBox(width: UiConstants.xsSpacing),
                const Icon(
                  Iconsax.edit_25,
                  color: ColorValues.grey90,
                  size: 12,
                )
              ]
            ),
            const SizedBox(height: UiConstants.xxsSpacing),
            RichText(
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              text: TextSpan(
                text: value.toString(),
                style: Theme.of(context).textTheme.displaySmall?.copyWith(color: ColorValues.teal50),
                children: [
                  TextSpan(
                      text: unit,
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(color: ColorValues.teal50),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
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
                    backgroundColor: ColorValues.teal10,
                    colorStart: ColorValues.teal30,
                    colorEnd: ColorValues.teal50,
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
                  type: 'bmi',
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
