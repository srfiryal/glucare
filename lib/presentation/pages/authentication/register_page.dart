import 'package:auto_route/auto_route.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:glucare/presentation/routes/router.gr.dart';
import 'package:iconsax/iconsax.dart';

import '../../../l10n/l10n.dart';
import '../../core/color_values.dart';
import '../../core/ui_constants.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_text_field.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
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
                          child: _buildLoginButton(),
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
          AppLocalizations.of(context).register_title,
          style: Theme.of(context).textTheme.displayMedium,
        ),
        const SizedBox(height: UiConstants.smSpacing),
        Text(
          AppLocalizations.of(context).register_desc,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ],
    );
  }

  Widget _buildForm() {
    return Column(
      children: [
        CustomTextField(
          controller: _fullNameController,
          label: AppLocalizations.of(context).full_name,
          hint: AppLocalizations.of(context).full_name_hint,
          icon: Iconsax.profile_tick5,
        ),
        const SizedBox(height: UiConstants.mdSpacing),
        CustomTextField(
          controller: _usernameController,
          label: AppLocalizations.of(context).username,
          hint: AppLocalizations.of(context).username_hint,
          icon: Iconsax.profile_tick5,
        ),
        const SizedBox(height: UiConstants.mdSpacing),
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
        const SizedBox(height: UiConstants.lgSpacing),
        CustomButton(
          onPressed: () {
            AutoRouter.of(context).replace(const DashboardRoute());
          },
          text: AppLocalizations.of(context).register,
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

  Widget _buildLoginButton() {
    return RichText(
      text: TextSpan(
        text: '${AppLocalizations.of(context).already_have_account} ',
        style: Theme.of(context).textTheme.bodyMedium,
        children: [
          TextSpan(
              text: AppLocalizations.of(context).lets_login,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: ColorValues.primary50,
                fontWeight: FontWeight.w600,
                decoration: TextDecoration.underline,
              ),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  AutoRouter.of(context).replace(const LoginRoute());
                }
          ),
        ],
      ),
    );
  }
}
