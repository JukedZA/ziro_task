import 'package:flutter/material.dart';
import 'package:transaction_management_app/src/core/theme/colors.dart';
import 'package:transaction_management_app/src/core/theme/text_styles.dart';

class PaymentItem extends StatelessWidget {
  const PaymentItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
      decoration: BoxDecoration(
        color: ThemeColors.containerOnBackground,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: ThemeColors.background,
            child: Icon(
              Icons.swipe_right_alt_rounded,
              color: ThemeColors.primaryIcon,
            ),
          ),
          const SizedBox(width: 8),
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(
                text: 'R700',
                size: 12,
                weight: Weights.bold,
              ),
              CustomText(
                text: '14.03.2024',
                size: 10,
              ),
            ],
          ),
          const SizedBox(width: 32),
        ],
      ),
    );
  }
}
