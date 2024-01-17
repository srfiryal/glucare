import 'package:flutter/material.dart';
import 'package:glucare/data/models/checker_question/checker_question_model.dart';
import 'package:glucare/l10n/l10n.dart';
import 'package:glucare/presentation/widgets/custom_button.dart';
import 'package:glucare/presentation/widgets/custom_info_card.dart';
import 'package:glucare/presentation/widgets/custom_shadow.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sizer/sizer.dart';

import '../../core/color_values.dart';
import '../../core/ui_constants.dart';
import '../../widgets/custom_app_bar.dart';
import '../../widgets/custom_gradient_icon.dart';

class DiabetesCheckerPage extends StatefulWidget {
  const DiabetesCheckerPage({super.key});

  @override
  State<DiabetesCheckerPage> createState() => _DiabetesCheckerState();
}

class _DiabetesCheckerState extends State<DiabetesCheckerPage> {
  final List<CheckerQuestionModel> _questions = [];
  final ValueNotifier<String> _selectedHistory = ValueNotifier('');
  final ValueNotifier<String> _selectedThirst = ValueNotifier('');
  final ValueNotifier<String> _selectedSugar = ValueNotifier('');
  final ValueNotifier<String> _selectedActivity = ValueNotifier('');
  final String _result = 'healthy';
  int _testIndex = 0;

  void _initQuestions() {
    _questions.add(CheckerQuestionModel(
      question: AppLocalizations.of(context).checker_question_1,
      image: 'assets/img_question_1.png',
      options: [AppLocalizations.of(context).yes, AppLocalizations.of(context).no, AppLocalizations.of(context).not_sure],
    ));
    _questions.add(CheckerQuestionModel(
      question: AppLocalizations.of(context).checker_question_2,
      image: 'assets/img_question_2.png',
      options: [AppLocalizations.of(context).yes, AppLocalizations.of(context).no, AppLocalizations.of(context).occasionally],
    ));
    _questions.add(CheckerQuestionModel(
      question: AppLocalizations.of(context).checker_question_3,
      image: 'assets/img_question_3.png',
      options: [AppLocalizations.of(context).frequently, AppLocalizations.of(context).rarely, AppLocalizations.of(context).occasionally],
    ));
    _questions.add(CheckerQuestionModel(
      question: AppLocalizations.of(context).checker_question_4,
      image: 'assets/img_question_4.png',
      options: [AppLocalizations.of(context).high, AppLocalizations.of(context).moderate, AppLocalizations.of(context).low],
    ));
  }

  @override
  Widget build(BuildContext context) {
    if (_questions.isEmpty) _initQuestions();
    Widget content = const SizedBox();

    switch (_testIndex) {
      case 0:
        content = _buildQuestion(
            _questions[_testIndex].image,
            _questions[_testIndex].question,
            _buildOptions(options: _questions[_testIndex].options, groupValue: _selectedHistory));
        break;
      case 1:
        content = _buildQuestion(
            _questions[_testIndex].image,
            _questions[_testIndex].question,
            _buildOptions(options: _questions[_testIndex].options, groupValue: _selectedThirst));
        break;
      case 2:
        content = _buildQuestion(
            _questions[_testIndex].image,
            _questions[_testIndex].question,
            _buildOptions(options: _questions[_testIndex].options, groupValue: _selectedSugar));
        break;
      case 3:
        content = _buildQuestion(
            _questions[_testIndex].image,
            _questions[_testIndex].question,
            _buildOptions(options: _questions[_testIndex].options, groupValue: _selectedActivity));
        break;
      case 4:
        content = _buildQuestion(
          'assets/img_question_bmi.png',
          AppLocalizations.of(context).let_us_know_you,
          _buildBmi(),
        );
        break;
      case 5:
        content = _buildQuestion(
          'assets/img_question_glucose.png',
          AppLocalizations.of(context).input_glucose,
          _buildGlucose(),
        );
        break;
      case 6:
        content = _buildQuestion(
          'assets/img_question_summary.png',
          AppLocalizations.of(context).summary,
          _buildSummary(_result),
        );
        break;
    }

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            CustomAppBar(
              title: AppLocalizations.of(context).diabetes_checker,
              action: Container(
                padding: const EdgeInsets.all(UiConstants.xsPadding),
                decoration: BoxDecoration(
                  border: Border.all(color: ColorValues.primary50, width: 1),
                  borderRadius: BorderRadius.circular(UiConstants.mdRadius),
                  gradient: const LinearGradient(
                    colors: [
                      ColorValues.primary30,
                      ColorValues.primary50,
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: Text(
                  '${_testIndex + 1 < 10 ? "0${_testIndex + 1}" : _testIndex + 1}/${_questions.length + 3 < 10 ? "0${_questions.length + 3}" : _questions.length + 3}',
                  style: Theme.of(context).textTheme.labelLarge?.copyWith(
                    color: ColorValues.white,
                  )
                ),
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(UiConstants.mdSpacing),
                child: content
              ),
            ),
            Container(
              width: 100.w,
              padding: const EdgeInsets.symmetric(horizontal: UiConstants.mdPadding, vertical: UiConstants.mdSpacing),
              child: Row(
                children: [
                  if (_testIndex > 0 && _testIndex < _questions.length + 2) Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: UiConstants.xsSpacing),
                      child: CustomButton(
                        onPressed: () {
                          if (_testIndex > 0) {
                            setState(() {
                              _testIndex--;
                            });
                          }
                        },
                        text: AppLocalizations.of(context).previous,
                        isOutlined: true,
                      ),
                    ),
                  ),
                  if (_testIndex <= _questions.length + 2) Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: UiConstants.xsSpacing),
                      child: CustomButton(
                        onPressed: () {
                          if (_testIndex < _questions.length + 2) {
                            setState(() {
                              _testIndex++;
                            });
                          }
                        },
                        text: _testIndex == _questions.length + 2 ? AppLocalizations.of(context).back_to_home : AppLocalizations.of(context).next,
                      ),
                    ),
                  ),
                ],
              )
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildQuestion(String image, String question, Widget answerField) {
    return Column(
      children: [
        const SizedBox(height: UiConstants.xsSpacing),
        Image.asset(
          image,
          width: 128,
          height: 128,
        ),
        const SizedBox(height: UiConstants.lgSpacing),
        RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              text: '${AppLocalizations.of(context).hello}, ',
              style: Theme.of(context).textTheme.bodyMedium,
              children: [
                TextSpan(
                  text: 'Fulan',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ],
            )
        ),
        const SizedBox(height: UiConstants.xxsSpacing),
        Text(
          question,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.displayMedium,
        ),
        const SizedBox(height: UiConstants.mdSpacing),
        answerField,
      ]
    );
  }

  Widget _buildOptions({required List<String> options, required ValueNotifier<String> groupValue, bool isVertical = true, bool hasRadio = true, bool isDense = false}) {
    return ValueListenableBuilder(
      valueListenable: groupValue,
      builder: (_, __, ___) {
        return isVertical
        ? Column(
          children: options.map((e) => GestureDetector(
            onTap: () {
              groupValue.value = e;
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: UiConstants.xsSpacing),
              child: CustomShadow(
                isBlur: false,
                child: Container(
                  padding: EdgeInsets.symmetric(
                    vertical: UiConstants.lgPadding,
                    horizontal: isDense ? 0 : UiConstants.lgPadding,
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: groupValue.value == e ? ColorValues.success50 : ColorValues.grey10,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(UiConstants.lgRadius),
                    color: groupValue.value == e ? ColorValues.success10 : ColorValues.white,
                  ),
                  child: Row(
                    children: [
                      if (hasRadio)
                        Container(
                          width: 24,
                          height: 24,
                          margin: const EdgeInsets.only(right: UiConstants.xsSpacing),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(UiConstants.maxRadius),
                            border: Border.all(
                              color: groupValue.value == e ? ColorValues.success50 : ColorValues.grey10,
                              width: 2,
                            ),
                          ),
                          child: Align(
                            alignment: Alignment.center,
                            child: Container(
                              width: 16,
                              height: 16,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(UiConstants.maxRadius),
                                color: groupValue.value == e ? ColorValues.success50 : Colors.transparent,
                              ),
                            ),
                          )
                        ),
                      Expanded(
                        child: Text(
                          e,
                          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: groupValue.value == e ? ColorValues.success50 : ColorValues.grey50,
                          ),
                        ),
                      ),
                    ],
                  )
                ),
              ),
            ),
          )).toList(),
        )
        : Row(
          children: options.map((e) => Expanded(
            child: CustomShadow(
              isBlur: false,
              child: Container(
                padding: EdgeInsets.symmetric(
                  vertical: isDense ? 0 : UiConstants.lgPadding,
                  horizontal: UiConstants.lgPadding,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(UiConstants.lgRadius),
                  color: groupValue.value == e ? ColorValues.success10 : ColorValues.white,
                ),
                child: Row(
                  children: [
                    if (hasRadio)
                      Radio(
                        value: e,
                        groupValue: groupValue,
                        activeColor: ColorValues.success50,
                        onChanged: (s) {
                          groupValue.value = s.toString();
                        },
                      ),
                    Expanded(
                      child: Text(
                        e,
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: groupValue.value == e ? ColorValues.success50 : ColorValues.grey50,
                        ),
                      ),
                    ),
                  ],
                )
              ),
            ),
          )).toList(),
        );
      }
    );
  }

  Widget _buildBmi() {
    return const Column(
      children: [

      ],
    );
  }

  Widget _buildGlucose() {
    return const Column(
      children: [

      ],
    );
  }

  Widget _buildSummary(String result) {
    String image, title, description;
    Color startColor, endColor;

    switch (result) {
      case 'hyper':
        image = 'assets/ic_glucose_hyper.png';
        title = AppLocalizations.of(context).glucose_hyper;
        description = AppLocalizations.of(context).glucose_hyper_desc;
        startColor = ColorValues.danger30;
        endColor = ColorValues.danger50;
        break;
      case 'hypo':
        image = 'assets/ic_glucose_hypo.png';
        title = AppLocalizations.of(context).glucose_hypo;
        description = AppLocalizations.of(context).glucose_hypo_desc;
        startColor = ColorValues.warning30;
        endColor = ColorValues.warning50;
        break;
      default:
        image = 'assets/ic_glucose_healthy.png';
        title = AppLocalizations.of(context).glucose_healthy;
        description = AppLocalizations.of(context).glucose_healthy_desc;
        startColor = ColorValues.success30;
        endColor = ColorValues.success50;
        break;
    }

    return Column(
      children: [
        const SizedBox(height: UiConstants.xsSpacing),
        CustomInfoCard(title: title, description: description, image: image, startColor: startColor, endColor: endColor),
        const SizedBox(height: UiConstants.mdSpacing),
        CustomShadow(
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
                        color: ColorValues.info10,
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
                        AppLocalizations.of(context).bmi,
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
        ),
      ],
    );
  }
}
