import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:iconly/iconly.dart';
import 'package:transaction_management_app/main.dart';
import 'package:transaction_management_app/src/components/custom/buttons/wide_text_button.dart';
import 'package:transaction_management_app/src/components/custom/fields/my_form_field.dart';
import 'package:transaction_management_app/src/core/router/page_nav_container.dart';
import 'package:transaction_management_app/src/core/theme/colors.dart';
import 'package:transaction_management_app/src/core/utils/extensions.dart';
import 'package:transaction_management_app/src/core/utils/shared_helper.dart';

class LoginBody extends StatefulWidget {
  const LoginBody({super.key});

  @override
  State<LoginBody> createState() => _LoginBodyState();
}

class _LoginBodyState extends State<LoginBody> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  // CONTROLLERS

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passController = TextEditingController();

  // BOOLS

  bool _isObscured = true;

  Future<void> _login() async {
    if (_emailController.text.trim().isEmpty ||
        _passController.text.trim().isEmpty) return;

    String email = _emailController.text.trim().toLowerCase();
    String pass = _passController.text;

    await appStore.login(email, pass, context);

    if (!mounted) return;

    if (appStore.isLoggedIn) {
      SharedHelper.login(email, pass);
      const PageNavContainer().launch(context);
    } else {
      context.showSnackBarError('Failed to login');
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      return Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            MyFormField(
              controller: _emailController,
              hint: 'Email',
              onSaved: (String? value) {},
              leadingIcon: const Icon(IconlyBold.message),
            ),
            const SizedBox(height: 16),
            MyFormField(
              controller: _passController,
              hint: 'Password',
              onSaved: (String? value) {},
              obscureText: _isObscured,
              leadingIcon: const Icon(IconlyBold.lock),
              trailingIcon: IconButton(
                onPressed: () {
                  setState(() {
                    _isObscured = !_isObscured;
                  });
                },
                icon: Icon(
                  _isObscured
                      ? Icons.remove_red_eye_outlined
                      : Icons.remove_red_eye_rounded,
                  color: _isObscured
                      ? ThemeColors.secondaryIcon
                      : ThemeColors.primaryIcon,
                ),
              ),
            ),
            const SizedBox(height: 16),
            WideTextButton(
              onTap: () {
                _login();
              },
              isLoading: appStore.isLoading,
              text: 'Login',
            ),
          ],
        ),
      );
    });
  }
}
