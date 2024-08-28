import 'package:flutter/cupertino.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:transaction_management_app/src/components/custom/buttons/text_button.dart';
import 'package:transaction_management_app/src/components/custom/container/empty_list.dart';
import 'package:transaction_management_app/src/components/expense_graph/chart_container.dart';
import 'package:transaction_management_app/src/components/home/items/transaction_item.dart';
import 'package:transaction_management_app/src/core/theme/colors.dart';
import 'package:transaction_management_app/src/core/theme/text_styles.dart';
import 'package:transaction_management_app/src/core/utils/extensions.dart';
import 'package:transaction_management_app/src/core/utils/formatters.dart';
import 'package:transaction_management_app/src/models/transaction/create_transaction.dart';
import 'package:transaction_management_app/src/pages/splash/loading_page.dart';
import 'package:transaction_management_app/src/stores/transaction_store.dart';

class TransactionContainer extends StatefulWidget {
  const TransactionContainer({super.key});

  @override
  State<TransactionContainer> createState() => _TransactionContainerState();
}

class _TransactionContainerState extends State<TransactionContainer> {
  final TransactionStore _store = TransactionStore();

  final int _containerSize = 68;
  final double _spacer = 8;

  @override
  void initState() {
    super.initState();
    _store.init();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) => _store.isLoading
          ? const Expanded(child: LoadingPage())
          : Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      text: 'ZiroPay Balance',
                      size: 16,
                      color: ThemeColors.secondaryText,
                    ),
                    HeadingText(
                      text: Formatters.currency(_store.balance),
                      size: 30,
                    ),
                    const SizedBox(height: 8),
                    ChartContainer(store: _store),
                    const SizedBox(height: 25),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const HeadingText(
                          text: 'Transaction History',
                        ),
                        MyTextButton(
                          text: 'Create',
                          onTap: () {
                            CreateTransaction(
                              store: _store,
                            ).launch(context);
                          },
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    _store.transactions.isEmpty
                        ? const EmptyList(
                            title: 'No Transactions Found',
                          )
                        : SizedBox(
                            height: (_containerSize * 4) + (_spacer * 4),
                            child: CupertinoScrollbar(
                              radius: const Radius.circular(50),
                              child: ListView.separated(
                                physics: const ClampingScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: _store.transactions.length,
                                itemBuilder: (context, index) =>
                                    TransactionItem(
                                  transaction: _store.transactions[index],
                                ),
                                separatorBuilder: (context, index) => SizedBox(
                                  height: _spacer,
                                ),
                              ),
                            ),
                          ),
                  ],
                ),
              ),
            ),
    );
  }
}
