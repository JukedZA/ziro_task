import 'package:flutter/material.dart';
import 'package:transaction_management_app/src/components/custom/animations/ball_loading_animation.dart';
import 'package:transaction_management_app/src/core/theme/colors.dart';
import 'package:transaction_management_app/src/core/theme/text_styles.dart';
import 'package:transaction_management_app/src/core/utils/extensions.dart';

class WideTextButton extends StatelessWidget {
  final void Function()? onTap;
  final String text;
  final Color? backgroundColor;
  final bool isLoading;
  const WideTextButton({
    super.key,
    required this.onTap,
    required this.text,
    this.backgroundColor,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isLoading
            ? ThemeColors.containerOnBackground
            : backgroundColor ?? AccentColors.purple,
        borderRadius: BorderRadius.circular(8),
      ),
      child: isLoading
          ? const Center(child: BallAnimation(ballSize: 15))
          : Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(
                  text: text,
                  size: 16,
                  weight: Weights.bold,
                ),
                Icon(
                  Icons.keyboard_arrow_right_rounded,
                  color: ThemeColors.primaryIcon,
                  size: 24,
                ),
              ],
            ),
    ).onTap(onTap);
  }
}
