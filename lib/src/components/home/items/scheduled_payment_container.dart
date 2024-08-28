import 'package:flutter/material.dart';
import 'package:transaction_management_app/src/components/home/items/payment_item.dart';

class ScheduledPaymentContainer extends StatelessWidget {
  const ScheduledPaymentContainer({super.key});

  @override
  Widget build(BuildContext context) {
    List<Widget> items = [
      const PaymentItem(),
      const PaymentItem(),
      const PaymentItem(),
    ];

    return SizedBox(
      height: 72,
      child: ListView.separated(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => items[index],
        separatorBuilder: (context, index) => const SizedBox(width: 8),
        itemCount: items.length,
      ),
    );
  }
}
