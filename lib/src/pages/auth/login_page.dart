import 'package:flutter/material.dart';
import 'package:transaction_management_app/src/components/custom/container/page_container.dart';
import 'package:transaction_management_app/src/components/login/login_body.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: PageContainer(
        child: Center(
          child: LoginBody(),
        ),
      ),
    );
  }
}
