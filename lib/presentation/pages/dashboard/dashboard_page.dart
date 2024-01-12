import 'package:flutter/material.dart';
import 'package:glucare/l10n/l10n.dart';
import 'package:glucare/presentation/core/color_values.dart';
import 'package:glucare/presentation/widgets/custom_gradient_icon.dart';
import 'package:glucare/presentation/widgets/custom_info_card.dart';
import 'package:glucare/presentation/widgets/custom_shadow.dart';
import 'package:iconsax/iconsax.dart';

import '../../core/ui_constants.dart';
import '../../widgets/step_card_widget.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            _buildAppBar(),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(vertical: UiConstants.mdPadding, horizontal: UiConstants.lgPadding),
                child: Column(
                  children: [
                    _buildGlucoseCard(),
                    _buildSectionSpacing(),
                    CustomInfoCard(
                      title: AppLocalizations.of(context).diabetes_checker,
                      description: AppLocalizations.of(context).diabetes_checker_desc,
                      image: 'assets/ic_diabetes_primary.png',
                      startColor: ColorValues.primary30,
                      endColor: ColorValues.primary50,
                      hasArrowIcon: true,
                    ),
                    _buildSectionSpacing(),
                    _buildHealthInfo(),
                    _buildSectionSpacing(),
                    _buildMedicationCard(),
                  ],
                ),
              ),
            )
          ],
        )
      )
    );
  }

  Widget _buildAppBar() {
    return CustomShadow(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: UiConstants.smPadding, horizontal: UiConstants.lgPadding),
        color: ColorValues.white.withOpacity(0.88),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${AppLocalizations.of(context).hello},',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  const SizedBox(height: UiConstants.xxsSpacing),
                  Text(
                    'Bayu Prajiwaksana',
                    style: Theme.of(context).textTheme.displaySmall,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              )
            ),
            const SizedBox(width: UiConstants.mdSpacing),
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                border: Border.all(color: ColorValues.primary10, width: 2),
                borderRadius: BorderRadius.circular(UiConstants.lgRadius),
                image: const DecorationImage(
                  image: NetworkImage('https://images.unsplash.com/photo-1539571696357-5a69c17a67c6?q=80&w=1000&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTJ8fHlvdW5nJTIwbWFufGVufDB8fDB8fHww'),
                  fit: BoxFit.cover,
                )
              ),
            )
          ]
        )
      ),
    );
  }

  Widget _buildGlucoseCard() {
    return CustomShadow(
      child: Container(
        padding: const EdgeInsets.all(UiConstants.smPadding),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(UiConstants.lgRadius),
          color: ColorValues.white,
        ),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(UiConstants.maxRadius),
                    color: ColorValues.primary10,
                  ),
                  child: Image.asset(
                    'assets/ic_diabetes_measure.png',
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
                        '${AppLocalizations.of(context).glucose}: 110${UiConstants.glucoseUnit}',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        'You’re on good state!',
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: ColorValues.grey50,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: UiConstants.mdSpacing),
                const Icon(
                  Iconsax.arrow_right_3,
                  color: ColorValues.grey90,
                  size: 24,
                )
              ]
            ),
            const SizedBox(height: UiConstants.smSpacing),
            Row(
              children: [
                _buildGlucoseLevel(
                  name: AppLocalizations.of(context).hypoglyc,
                  value: '<80',
                  icon: Iconsax.arrow_circle_down4,
                  iconBackground: ColorValues.warning10,
                  iconColorStart: ColorValues.warning30,
                  iconColorEnd: ColorValues.warning50
                ),
                const SizedBox(width: UiConstants.mdSpacing),
                _buildGlucoseLevel(
                  name: AppLocalizations.of(context).normal,
                  value: '>79',
                  icon: Iconsax.like_15,
                  iconBackground: ColorValues.success10,
                  iconColorStart: ColorValues.success30,
                  iconColorEnd: ColorValues.success50
                ),
                const SizedBox(width: UiConstants.mdSpacing),
                _buildGlucoseLevel(
                  name: AppLocalizations.of(context).hyperglyc,
                  value: '>120',
                  icon: Iconsax.arrow_circle_up3,
                  iconBackground: ColorValues.danger10,
                  iconColorStart: ColorValues.danger30,
                  iconColorEnd: ColorValues.danger50
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _buildGlucoseLevel({required String name, required String value, required IconData icon, required Color iconBackground, required Color iconColorStart, required iconColorEnd}) {
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
                      text: UiConstants.glucoseUnit,
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

  Widget _buildSectionSpacing() {
    return const SizedBox(height: UiConstants.mdSpacing);
  }

  Widget _buildHealthInfo() {
    return Row(
      children: [
        Expanded(
          child: _buildHealthLevelCard(
            title: AppLocalizations.of(context).bmi,
            value: '24.1',
            unit: UiConstants.bmiUnit,
            status: 'Healthy Weight',
            update: 'Updated just now',
          ),
        ),
        const SizedBox(width: UiConstants.mdSpacing),
        Expanded(
          child: _buildHealthLevelCard(
            title: AppLocalizations.of(context).blood,
            value: '120',
            unit: UiConstants.bloodPressureUnit,
            status: 'Normal',
            update: 'Updated yesterday',
          ),
        ),
      ],
    );
  }

  Widget _buildHealthLevelCard({required String title, required String value, required String unit, required String status, required String update}) {
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
                    color: title == AppLocalizations.of(context).bmi ? ColorValues.info10 : ColorValues.warning10,
                  ),
                  child: Image.asset(
                    title == AppLocalizations.of(context).bmi ? 'assets/ic_bmi.png' : 'assets/ic_blood_pressure.png',
                    width: 12,
                    height: 12,
                  ),
                ),
                const SizedBox(width: UiConstants.xsSpacing),
                Expanded(
                  child: Text(
                    title,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const SizedBox(width: UiConstants.mdSpacing),
                const Icon(
                  Iconsax.arrow_right_3,
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
                text: value,
                style: Theme.of(context).textTheme.displayLarge,
                children: [
                  TextSpan(
                    text: unit,
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
                  status,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            const SizedBox(height: UiConstants.lgSpacing),
            Text(
              update,
              style: Theme.of(context).textTheme.labelSmall?.copyWith(color: ColorValues.grey50),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: UiConstants.xxsSpacing),
          ],
        ),
      ),
    );
  }

  Widget _buildMedicationCard() {
    return CustomShadow(
      child: Container(
        padding: const EdgeInsets.all(UiConstants.smPadding),
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
                    color: ColorValues.danger10,
                  ),
                  child: Image.asset(
                    'assets/ic_medication.png',
                    width: 20,
                    height: 20,
                  ),
                ),
                const SizedBox(width: UiConstants.xsSpacing),
                Expanded(
                  child: RichText(
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    text: TextSpan(
                      text: AppLocalizations.of(context).medication,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                      children: [
                        TextSpan(
                          text: ' (${AppLocalizations.of(context).for_today})',
                          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: ColorValues.grey50,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: UiConstants.mdSpacing),
                const Icon(
                  Iconsax.arrow_right_3,
                  color: ColorValues.grey90,
                  size: 16,
                ),
              ],
            ),
            const SizedBox(height: UiConstants.mdSpacing),
            const StepCardWidget(
                title: 'Paracetamol',
                description1: '1x pill',
                description2: '7am',
                description3: 'After meal',
                isFirst: true,
                isActive: true,
            ),
            const StepCardWidget(
                title: 'Paracetamol',
                description1: '1x pill',
                description2: '7am',
                description3: 'After meal',
                isActive: false,
            ),
            const StepCardWidget(
                title: 'Paracetamol',
                description1: '1x pill',
                description2: '7am',
                description3: 'After meal',
                isLast: true,
                isActive: false,
            ),
          ],
        ),
      ),
    );
  }
}
