import 'package:flutter/material.dart';
import 'package:transaction_management_app/src/components/custom/container/page_container.dart';
import 'package:transaction_management_app/src/components/home/items/transaction_container.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const PageContainer(
      child: TransactionContainer(),
    );
  }
}
