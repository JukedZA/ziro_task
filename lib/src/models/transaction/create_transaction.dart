import 'package:flutter/material.dart';
import 'package:transaction_management_app/main.dart';
import 'package:transaction_management_app/src/components/custom/container/page_container.dart';
import 'package:transaction_management_app/src/components/transaction/create_transaction_body.dart';
import 'package:transaction_management_app/src/models/user/user_model.dart';
import 'package:transaction_management_app/src/stores/transaction_store.dart';

class CreateTransaction extends StatelessWidget {
  final TransactionStore store;
  const CreateTransaction({
    super.key,
    required this.store,
  });

  @override
  Widget build(BuildContext context) {
    UserModel user = appStore.currentUser!;

    return Scaffold(
      appBar: AppBar(),
      body: PageContainer(
        removeTopPadding: true,
        child: CreateTransactionBody(
          store: store,
          user: user,
        ),
      ),
    );
  }
}
