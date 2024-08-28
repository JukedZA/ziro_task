import 'package:flutter/material.dart';
import 'package:transaction_management_app/main.dart';
import 'package:transaction_management_app/src/components/custom/buttons/wide_text_button.dart';
import 'package:transaction_management_app/src/core/theme/colors.dart';
import 'package:transaction_management_app/src/core/theme/text_styles.dart';
import 'package:transaction_management_app/src/models/user/user_model.dart';

class ProfileBody extends StatelessWidget {
  const ProfileBody({super.key});

  @override
  Widget build(BuildContext context) {
    UserModel user = appStore.currentUser!;

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          children: [
            HeadingText(
              text: user.username,
            ),
            CustomText(
              text: user.code,
              color: ThemeColors.secondaryText,
              size: 14,
            ),
          ],
        ),
        WideTextButton(
          onTap: () {
            appStore.signOut();
          },
          text: 'Signout',
        ),
      ],
    );
  }
}
