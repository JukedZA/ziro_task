import 'package:flutter/material.dart';
import 'package:transaction_management_app/src/components/custom/container/page_container.dart';
import 'package:transaction_management_app/src/components/profile/profile_body.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const PageContainer(
      child: ProfileBody(),
    );
  }
}
