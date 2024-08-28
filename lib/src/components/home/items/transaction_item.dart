import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:transaction_management_app/src/core/theme/colors.dart';
import 'package:transaction_management_app/src/core/theme/text_styles.dart';
import 'package:transaction_management_app/src/models/transaction/transaction_model.dart';

class TransactionItem extends StatelessWidget {
  final TransactionModel transaction;
  const TransactionItem({
    super.key,
    required this.transaction,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: ThemeColors.containerOnBackground,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: ThemeColors.background,
              borderRadius: BorderRadius.circular(16),
            ),
            child: const Icon(
              IconlyBold.buy,
              color: AccentColors.purple,
              size: 20,
            ),
          ),
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomText(
                text: 'Placeholder',
                size: 16,
                weight: Weights.medium,
              ),
              CustomText(
                text: transaction.formattedDate,
                size: 10,
              ),
            ],
          ),
          const Spacer(),
          CustomText(
            text: transaction.formattedCurrency,
            size: 12,
            color: transaction.transactionType == 'Outgoing'
                ? AccentColors.purple
                : AccentColors.teal,
            weight: Weights.bold,
          ),
        ],
      ),
    );
  }
}
