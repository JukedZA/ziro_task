import 'package:flutter/material.dart';
import 'package:transaction_management_app/main.dart';
import 'package:transaction_management_app/src/core/router/page_nav_container.dart';
import 'package:transaction_management_app/src/core/theme/colors.dart';
import 'package:transaction_management_app/src/core/utils/extensions.dart';
import 'package:transaction_management_app/src/core/utils/shared_helper.dart';
import 'package:transaction_management_app/src/models/user/user_model.dart';
import 'package:transaction_management_app/src/pages/auth/login_page.dart';
import 'package:transaction_management_app/src/pages/splash/loading_page.dart';
import 'package:transaction_management_app/src/services/api_caller.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();

    _redirect();
  }

  Future<void> _redirect() async {
    await SharedHelper.init();

    String? username = SharedHelper.username;
    String? password = SharedHelper.password;

    if (username != null && password != null) {
      UserModel? user = await ApiCaller.login(
        email: username,
        password: password,
      );

      if (!mounted) return;

      if (user == null) {
        const LoginPage().launch(context);
      } else {
        appStore.initUser(user);
        const PageNavContainer().launch(context);
      }
    } else {
      if (!mounted) return;
      const LoginPage().launch(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeColors.background,
      body: const Center(
        child: LoadingPage(),
      ),
    );
  }
}
