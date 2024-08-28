import 'package:flutter/material.dart';
import 'package:transaction_management_app/src/core/theme/colors.dart';
import 'package:transaction_management_app/src/core/theme/text_styles.dart';

class MyTextButton extends StatelessWidget {
  final String text;
  final void Function()? onTap;
  const MyTextButton({
    super.key,
    required this.text,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onTap,
      child: HeadingText(
        text: text,
        weight: Weights.reg,
        color: ThemeColors.secondaryText,
        size: 14,
      ),
    );
  }
}
