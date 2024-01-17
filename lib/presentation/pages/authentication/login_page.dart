import 'package:auto_route/auto_route.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:glucare/l10n/l10n.dart';
import 'package:glucare/presentation/core/ui_constants.dart';
import 'package:glucare/presentation/routes/router.gr.dart';
import 'package:glucare/presentation/widgets/custom_button.dart';
import 'package:glucare/presentation/widgets/custom_text_field.dart';
import 'package:iconsax/iconsax.dart';

import '../../core/color_values.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: Padding(
                padding: const EdgeInsets.all(UiConstants.lgPadding),
                child: Column(
                  children: [
                    _buildHeading(),
                    const SizedBox(height: UiConstants.lgSpacing),
                    _buildForm(),
                    const SizedBox(height: UiConstants.lgSpacing),
                    const Spacer(),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: UiConstants.lgPadding),
                      child: _buildRegisterButton(),
                    )
                  ],
                ),
              )
            ),
          ],
        ),
      )
    );
  }

  Widget _buildHeading() {
    return Column(
      children: [
        Image.asset(
          'assets/ic_app.png',
          width: 64,
          height: 64,
        ),
        const SizedBox(height: UiConstants.mdSpacing),
        Text(
          AppLocalizations.of(context).login_title,
          style: Theme.of(context).textTheme.displayMedium,
        ),
        const SizedBox(height: UiConstants.smSpacing),
        Text(
          AppLocalizations.of(context).login_desc,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ],
    );
  }

  Widget _buildForm() {
    return Column(
      children: [
        CustomTextField(
          controller: _emailController,
          label: AppLocalizations.of(context).email,
          hint: AppLocalizations.of(context).email_hint,
          icon: Iconsax.sms5,
        ),
        const SizedBox(height: UiConstants.mdSpacing),
        CustomTextField(
          controller: _passwordController,
          label: AppLocalizations.of(context).password,
          hint: AppLocalizations.of(context).password_hint,
          icon: Iconsax.key5,
          isPassword: true,
        ),
        const SizedBox(height: UiConstants.smSpacing),
        Align(
          alignment: Alignment.centerRight,
          child: GestureDetector(
            onTap: () {},
            child: Text(
              AppLocalizations.of(context).forgot_password,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                color: ColorValues.primary50,
                decoration: TextDecoration.underline,
              ),
            ),
          ),
        ),
        const SizedBox(height: UiConstants.lgSpacing),
        CustomButton(
          onPressed: () {
            AutoRouter.of(context).replace(const DashboardRoute());
          },
          text: AppLocalizations.of(context).login,
        ),
        const SizedBox(height: UiConstants.mdSpacing),
        _buildOrDivider(),
        const SizedBox(height: UiConstants.mdSpacing),
        OutlinedButton(
          onPressed: () {},
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/ic_google.png', width: 24, height: 24),
              const SizedBox(width: UiConstants.smSpacing),
              Text(
                AppLocalizations.of(context).continue_with_google,
              ),
            ],
          ),
        )
      ],
    );
  }

  Widget _buildOrDivider() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 64,
          height: 3,
          margin: const EdgeInsets.symmetric(horizontal: 12),
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [
                Colors.transparent,
                ColorValues.grey50,
              ],
            ),
            borderRadius: BorderRadius.circular(UiConstants.lgRadius),
          ),
        ),
        Text(
          AppLocalizations.of(context).or,
          style: Theme.of(context).textTheme.labelLarge
        ),
        Container(
          width: 64,
          height: 3,
          margin: const EdgeInsets.symmetric(horizontal: 12),
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [
                ColorValues.grey50,
                Colors.transparent,
              ],
            ),
            borderRadius: BorderRadius.circular(UiConstants.lgRadius),
          ),
        ),
      ],
    );
  }

  Widget _buildRegisterButton() {
    return RichText(
      text: TextSpan(
        text: '${AppLocalizations.of(context).dont_have_account} ',
        style: Theme.of(context).textTheme.bodyMedium,
        children: [
          TextSpan(
            text: AppLocalizations.of(context).lets_register,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: ColorValues.primary50,
              fontWeight: FontWeight.w600,
              decoration: TextDecoration.underline,
            ),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                AutoRouter.of(context).replace(const RegisterRoute());
              }
          ),
        ],
      ),
    );
  }
}
