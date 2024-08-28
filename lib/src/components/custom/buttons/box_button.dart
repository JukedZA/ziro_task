import 'package:flutter/material.dart';
import 'package:transaction_management_app/src/core/theme/colors.dart';
import 'package:transaction_management_app/src/core/theme/text_styles.dart';
import 'package:transaction_management_app/src/core/utils/extensions.dart';

class BoxButton extends StatelessWidget {
  final String text;
  final void Function()? onTap;
  final Color? color;
  const BoxButton({
    super.key,
    required this.text,
    required this.onTap,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: color ?? ThemeColors.containerOnBackground,
        borderRadius: BorderRadius.circular(16),
      ),
      child: CustomText(
        text: text,
        size: 12,
      ),
    ).onTap(onTap);
  }
}
